// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const builtin = @import("builtin");
const registry = @import("shaders/registry.zig");
const slang = @import("slang");

const ShaderCompiler = @This();

pub const TargetKind = enum {
    hlsl,
    glsl,
    spirv,

    fn toSlang(self: TargetKind) slang.CompileTarget {
        return switch (self) {
            .hlsl => .hlsl,
            .glsl => .glsl,
            .spirv => .spirv,
        };
    }

    fn profile(self: TargetKind) [:0]const u8 {
        return switch (self) {
            .hlsl => "sm_6_0",
            .glsl => "glsl_450",
            .spirv => "spirv_1_5",
        };
    }
};

pub const CompileResult = struct {
    /// Valid until `deinit`.
    code: []const u8,
    blob: slang.Blob,

    pub fn deinit(self: *CompileResult) void {
        self.blob.deinit();
        self.* = undefined;
    }
};

global: slang.GlobalSession,
modules: []const registry.ShaderModule = &registry.engine_modules,

pub fn init() !ShaderCompiler {
    return .{ .global = try slang.GlobalSession.create() };
}

pub fn deinit(self: *ShaderCompiler) void {
    self.global.deinit();
}

pub fn compileStage(
    self: ShaderCompiler,
    module_name: [:0]const u8,
    source: [:0]const u8,
    entrypoint: [:0]const u8,
    target: TargetKind,
) !CompileResult {
    var diag: slang.Diagnostics = .{};
    defer diag.deinit();

    return self.compileInner(module_name, source, entrypoint, target, &diag) catch |err| {
        std.log.err("Slang compile error ({s}::{s}): {s}\n{s}", .{
            module_name, entrypoint, @errorName(err), diag.text(),
        });
        return error.CompileFailed;
    };
}

fn compileInner(
    self: ShaderCompiler,
    module_name: [:0]const u8,
    source: [:0]const u8,
    entrypoint: [:0]const u8,
    target: TargetKind,
    diag: *slang.Diagnostics,
) !CompileResult {
    const targets = [_]slang.TargetDesc{.{
        .format = target.toSlang(),
        .profile = findProfile(self.global, target.profile()),
    }};

    const session = try self.global.createSession(.{ .targets = &targets });
    defer session.deinit();

    for (self.modules) |m| {
        var path_buf: [256]u8 = undefined;
        const path = try std.mem.printSentinel(&path_buf, "{s}.slang", .{m.name}, 0);
        // session keeps its own reference
        const loaded = try session.loadModuleFromSource(m.name, path, m.source, diag);
        loaded.deinit();
    }

    var name_buf: [256]u8 = undefined;
    const file_name = try std.mem.printSentinel(&name_buf, "{s}.slang", .{module_name}, 0);

    const module = try session.loadModuleFromSource(module_name, file_name, source, diag);
    defer module.deinit();

    const entry = try findEntryPoint(module, entrypoint);
    defer entry.deinit();

    const components = [_]*slang.IComponentType{ module.asComponent().raw, entry.raw };
    const program = try session.createComposite(&components, diag);
    defer program.deinit();

    const linked = try program.link(diag);
    defer linked.deinit();

    const blob = try linked.getTargetCode(0, diag);
    return .{ .code = blob.bytes(), .blob = blob };
}

// We have to implement this stuff ourselves because the bindings don't expose or even have them.

const mcall: std.builtin.CallingConvention = if (builtin.target.os.tag == .windows) .winapi else .c;

fn vtableSlot(comptime F: type, vtable: anytype, comptime index: usize) F {
    const slots: [*]const *const anyopaque = @ptrCast(vtable);
    return @ptrCast(@alignCast(slots[index]));
}

fn findProfile(global: slang.GlobalSession, name: [:0]const u8) u32 {
    const F = *const fn (*slang.IGlobalSession, [*:0]const u8) callconv(mcall) u32;
    return vtableSlot(F, global.raw.vtable, 4)(global.raw, name.ptr);
}

fn findEntryPoint(module: slang.Module, name: [:0]const u8) !slang.Component {
    const F = *const fn (*slang.IModule, [*:0]const u8, *?*slang.IComponentType) callconv(mcall) slang.Result;
    var out: ?*slang.IComponentType = null;
    const r = vtableSlot(F, module.raw.vtable, 17)(module.raw, name.ptr, &out);
    if (slang.failed(r) or out == null) return error.EntryPointFailed;
    return .{ .raw = out.?, .owned = true };
}
