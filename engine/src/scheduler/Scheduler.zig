// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const builtin = @import("builtin");
const core = @import("../core/core.zig");
pub const Fiber = if (builtin.os.tag == .windows)
    @import("fiber/Win32Fiber.zig")
else
    @import("fiber/PosixFiber.zig");
const Os = @import("../os/Os.zig");
pub const Counter = @import("Counter.zig");
pub const Stepper = @import("Stepper.zig");
pub const Job = @import("Job.zig");

const fiber_pool_size = 256;
const fiber_stack_size = 256 * 1024;
const priority_count = Job.JobPriority.priority_count;
// Order is critical, high, low, normal, then background.
const deque_capacity = [priority_count]usize{ 256, 512, 2048, 512, 512 };
const inbox_capacity = 1024;

const JobQueue = core.threading.MPMCQueue(Job, inbox_capacity);
const FiberQueue = core.threading.MPMCQueue(*Fiber, fiber_pool_size);

const Runnable = union(enum) { job: Job, fiber: *Fiber };
const PendingPark = struct { fiber: *Fiber, counter: *Counter };

// Represents a thread's state.
const Worker = struct {
    id: usize,
    scheduler: *Scheduler,
    home: Fiber = .{ .stack = &.{} },
    current: *Fiber = undefined,
    pending_park: ?PendingPark = null,
    in_fiber: bool = false,
};

const Scheduler = @This();
os: *const Os,
io: std.Io,
allocator: std.mem.Allocator,
fibers: []Fiber,
free_fibers: core.threading.MPMCQueue(*Fiber, fiber_pool_size),
workers: []Worker,
threads: []std.Thread, // Worker 0 is always the one that called init
ready_fibers: []core.threading.Deque(*Fiber),
deques: [priority_count][]core.threading.Deque(Job),
inbox_jobs: []JobQueue,
main_jobs: JobQueue,
main_fibers: FiberQueue,
running: std.atomic.Value(bool) = .init(true),
main_worker_id: usize = 0,

var next_submit_worker: std.atomic.Value(usize) = .init(0);
threadlocal var tls_worker: ?*Worker = null;

// Always access through these to avoid TLS fudgery!!
noinline fn worker() *Worker {
    return tls_worker.?;
}
noinline fn workerMaybe() ?*Worker {
    return tls_worker;
}
pub noinline fn current() *Scheduler {
    return worker().scheduler;
}
pub noinline fn currentHomeFiber() *Fiber {
    return &worker().home;
}
pub noinline fn afterSwitch() void {
    const w = worker();
    w.scheduler.publishPendingPark(w);
}

pub fn init(self: *Scheduler, allocator: std.mem.Allocator, io: std.Io, os: *const Os) !void {
    const topology = try os.scheduling().getTopology(allocator);
    defer topology.deinit(allocator);
    const n = topology.cores.len;

    var fibers: std.ArrayList(Fiber) = try .initCapacity(allocator, fiber_pool_size);
    errdefer {
        for (fibers.items) |*f| f.deinit();
        fibers.deinit(allocator);
    }
    for (0..fiber_pool_size) |_| {
        fibers.appendAssumeCapacity(try .init(fiber_stack_size));
    }
    const owned_fibers = try fibers.toOwnedSlice(allocator);
    errdefer allocator.free(owned_fibers);

    var free_fibers: core.threading.MPMCQueue(*Fiber, fiber_pool_size) = .init();
    for (owned_fibers) |*f| try free_fibers.push(f);

    // For fibers that have been woken, but not resumed. These are processed before jobs.
    var ready_fibers: std.ArrayList(core.threading.Deque(*Fiber)) = try .initCapacity(allocator, n);
    errdefer for (ready_fibers.items) |*dq| dq.deinit(allocator);

    for (0..n) |_| ready_fibers.appendAssumeCapacity(try .init(allocator, 4096));

    var deques: [priority_count][]core.threading.Deque(Job) = undefined;
    errdefer for (deques) |dq| {
        for (dq) |*d| d.deinit(allocator);
        allocator.free(dq);
    };

    for (&deques, 0..) |*dq, p| {
        var list: std.ArrayList(core.threading.Deque(Job)) = try .initCapacity(allocator, n);
        for (0..n) |_| try list.append(allocator, try .init(allocator, deque_capacity[p]));
        dq.* = try list.toOwnedSlice(allocator);
    }

    const workers = try allocator.alloc(Worker, n);
    for (workers, 0..) |*w, i| w.* = .{ .id = i, .scheduler = self };

    const inbox = try allocator.alloc(JobQueue, n);
    for (inbox) |*q| q.* = .init();

    self.* = .{
        .os = os,
        .io = io,
        .allocator = allocator,
        .fibers = owned_fibers,
        .free_fibers = free_fibers,
        .workers = workers,
        .threads = try allocator.alloc(std.Thread, n - 1),
        .ready_fibers = try ready_fibers.toOwnedSlice(allocator),
        .deques = deques,
        .inbox_jobs = inbox,
        .main_jobs = .init(),
        .main_fibers = .init(),
    };

    // Calling thread is worker 0
    self.attachThread(0);
    var spawned: usize = 0;
    errdefer {
        self.running.store(false, .release);
        for (self.threads[0..spawned]) |t| t.join();
    }
    for (self.threads, 1..) |*t, id| {
        t.* = try .spawn(.{}, workerMain, .{ self, id });
        spawned += 1;
    }
}

pub fn deinit(self: *Scheduler) void {
    self.running.store(false, .release);
    for (self.threads) |t| t.join();

    for (self.fibers) |*f| f.deinit();
    self.allocator.free(self.fibers);
    for (self.deques) |dq| {
        for (dq) |*d| d.deinit(self.allocator);
        self.allocator.free(dq);
    }
    for (self.ready_fibers) |*d| d.deinit(self.allocator);
    self.allocator.free(self.ready_fibers);
    self.allocator.free(self.inbox_jobs);
    self.allocator.free(self.workers);
    self.allocator.free(self.threads);
}

fn attachThread(self: *Scheduler, id: usize) void {
    const w = &self.workers[id];
    tls_worker = w;
    Fiber.initHome(&w.home);
}

fn workerMain(self: *Scheduler, id: usize) void {
    self.attachThread(id);

    var spins: usize = 0;
    while (self.running.load(.acquire)) {
        if (self.runOne(id)) {
            spins = 0;
            continue;
        }
        spins += 1;
        // TODO: Improve this. Doing it this way introduces latency issues
        if (spins < 100) {
            std.atomic.spinLoopHint();
        } else if (spins < 1000) {
            std.Thread.yield() catch {};
        } else {
            self.io.sleep(.fromNanoseconds(std.time.ns_per_ms), .awake) catch {};
        }
    }
}

fn runOne(self: *Scheduler, id: usize) bool {
    const w = &self.workers[id];
    std.debug.assert(!w.in_fiber);

    const r = self.popNextRunnable(id) orelse return false;
    const fiber = self.resolveRunnable(r);

    w.current = fiber;
    w.in_fiber = true;
    w.home.switchTo(fiber);
    w.in_fiber = false;

    std.debug.assert(w.current.state == .finished);
    self.free_fibers.push(w.current) catch @panic("free_fibers overflow");
    return true;
}

/// Called once per frame in the main thread to run its work.
pub fn pumpMain(self: *Scheduler) void {
    while (self.runOne(self.main_worker_id)) {}
}

fn resolveRunnable(self: *Scheduler, runnable: Runnable) *Fiber {
    switch (runnable) {
        .fiber => |f| return f,
        .job => |j| {
            const f = self.free_fibers.pop() orelse
                @panic("Fiber pool exhausted. Increase `fiber_pool_size` or reduce wait-chain depth");
            f.job = j;
            f.reset(jobTrampoline, @ptrCast(f));
            return f;
        },
    }
}

fn pushQueue(q: anytype, item: anytype, may_block: bool) void {
    while (true) {
        q.push(item) catch {
            if (!may_block) @panic("Scheduler queue overflow. Raise capacity");
            std.Thread.yield() catch {};
            continue;
        };
        return;
    }
}

pub fn submit(self: *Scheduler, job: Job) void {
    const me = workerMaybe();
    const on_worker = me != null and me.?.scheduler == self;

    if (job.affinity == .main) {
        return pushQueue(&self.main_jobs, job, !on_worker);
    }
    if (on_worker) {
        const id = me.?.id;
        if (self.deques[@backingInt(job.priority)][id].pushToBottom(job)) return;
        return pushQueue(&self.inbox_jobs[id], job, false);
    }

    const target = next_submit_worker.fetchAdd(1, .monotonic) % self.workers.len;
    pushQueue(&self.inbox_jobs[target], job, true);
}

fn drainInbox(self: *Scheduler, id: usize) ?Job {
    while (self.inbox_jobs[id].pop()) |job| {
        if (!self.deques[@backingInt(job.priority)][id].pushToBottom(job)) return job;
    }
    return null;
}

fn popNextRunnable(self: *Scheduler, id: usize) ?Runnable {
    const is_main = id == self.main_worker_id;
    if (is_main) {
        if (self.main_fibers.pop()) |f| return .{ .fiber = f };
    }
    if (self.ready_fibers[id].popFromBottom()) |f| return .{ .fiber = f };
    if (is_main) {
        if (self.main_jobs.pop()) |j| return .{ .job = j };
    }
    if (self.drainInbox(id)) |j| return .{ .job = j };
    for (self.deques) |dq| {
        if (dq[id].popFromBottom()) |j| return .{ .job = j };
    }

    const n = self.workers.len;
    var offset: usize = 1;
    while (offset < n) : (offset += 1) {
        const victim = (id + offset) % n;
        if (self.ready_fibers[victim].steal()) |f| return .{ .fiber = f };
    }
    for (self.deques) |dq| {
        offset = 1;
        while (offset < n) : (offset += 1) {
            const victim = (id + offset) % n;
            if (dq[victim].steal()) |j| return .{ .job = j };
        }
    }
    return null;
}

fn publishPendingPark(self: *Scheduler, w: *Worker) void {
    const p = w.pending_park orelse return;
    w.pending_park = null;

    p.counter.lock.lockUncancelable(self.io);
    if (p.counter.value.load(.acquire) == 0) {
        p.counter.lock.unlock(self.io);
        self.makeRunnable(p.fiber);
        return;
    }
    p.fiber.next_waiter = p.counter.waiters;
    p.counter.waiters = p.fiber;
    p.counter.lock.unlock(self.io);
}

/// Should only be called from a worker thread
pub fn makeRunnable(self: *Scheduler, fiber: *Fiber) void {
    fiber.state = .idle;
    if (fiber.job) |j| if (j.affinity == .main) {
        self.main_fibers.push(fiber) catch unreachable;
        return;
    };
    const w = worker();
    std.debug.assert(w.scheduler == self);
    if (!self.ready_fibers[w.id].pushToBottom(fiber)) unreachable;
}

/// Parks the current fiber until `counter` hits zero, running other work while waiting.
/// Only valid inside a fiber.
pub fn wait(self: *Scheduler, counter: *Counter) void {
    const w0 = worker();
    std.debug.assert(w0.in_fiber);

    const next = while (true) {
        if (counter.isDone(self.io)) return;
        if (self.popNextRunnable(w0.id)) |r| break self.resolveRunnable(r);
        std.Thread.yield() catch {};
    };

    const parked = w0.current;
    parked.state = .parked;
    w0.current = next;
    w0.pending_park = .{ .fiber = parked, .counter = counter };

    parked.switchTo(next);

    // We could be on a different, thread so make sure to re-fetch.
    const w = worker();
    w.current = parked;
    parked.state = .running;
}

/// For non-fiber contexts (like the main thread).
/// Helps run jobs until the given counter reaches zero.
pub fn waitHelp(self: *Scheduler, counter: *Counter) void {
    const w = workerMaybe() orelse return self.waitBlocking(counter);
    while (!counter.isDone(self.io)) {
        if (!self.runOne(w.id)) std.Thread.yield() catch {};
    }
}

/// For threads that aren't workers.
pub fn waitBlocking(self: *Scheduler, counter: *Counter) void {
    while (!counter.isDone(self.io)) std.Thread.yield() catch {};
}

fn jobTrampoline(data: *anyopaque) void {
    const fiber: *Fiber = @ptrCast(@alignCast(data));
    const job = fiber.job.?;
    job.func(job.data);

    if (job.counter) |c| {
        const s = current();
        c.decrement(s);
    }
}
