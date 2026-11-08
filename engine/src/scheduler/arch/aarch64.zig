// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const builtin = @import("builtin");

pub const Registers = extern struct {
    sp: usize = 0,
    x19: usize = 0,
    x20: usize = 0,
    x21: usize = 0,
    x22: usize = 0,
    x23: usize = 0,
    x24: usize = 0,
    x25: usize = 0,
    x26: usize = 0,
    x27: usize = 0,
    x28: usize = 0,
    fp: usize = 0,
    lr: usize = 0,
    d8: u64 = 0,
    d9: u64 = 0,
    d10: u64 = 0,
    d11: u64 = 0,
    d12: u64 = 0,
    d13: u64 = 0,
    d14: u64 = 0,
    d15: u64 = 0,
};

pub fn swap(_: *Registers, _: *Registers) callconv(.naked) void {
    asm volatile (
        \\ mov x9, sp
        \\ str x9, [x0, #0x00]
        \\ stp x19, x20, [x0, #0x08]
        \\ stp x21, x22, [x0, #0x18]
        \\ stp x23, x24, [x0, #0x28]
        \\ stp x25, x26, [x0, #0x38]
        \\ stp x27, x28, [x0, #0x48]
        \\ stp x29, x30, [x0, #0x58]
        \\ stp d8,  d9,  [x0, #0x68]
        \\ stp d10, d11, [x0, #0x78]
        \\ stp d12, d13, [x0, #0x88]
        \\ stp d14, d15, [x0, #0x98]
        \\
        \\ ldr x9, [x1, #0x00]
        \\ mov sp, x9
        \\ ldp x19, x20, [x1, #0x08]
        \\ ldp x21, x22, [x1, #0x18]
        \\ ldp x23, x24, [x1, #0x28]
        \\ ldp x25, x26, [x1, #0x38]
        \\ ldp x27, x28, [x1, #0x48]
        \\ ldp x29, x30, [x1, #0x58]
        \\ ldp d8,  d9,  [x1, #0x68]
        \\ ldp d10, d11, [x1, #0x78]
        \\ ldp d12, d13, [x1, #0x88]
        \\ ldp d14, d15, [x1, #0x98]
        \\ ret
    );
}

// shit gets fucked badly if this is ever inlined
pub noinline fn doSwap(from: *Registers, to: *Registers) void {
    const sym = comptime if (builtin.target.os.tag.isDarwin()) "bl _swap" else "bl swap";
    asm volatile (sym
        :
        : [from] "{x0}" (from),
          [to] "{x1}" (to),
        : .{
          .x0 = true,
          .x1 = true,
          .x9 = true,
          .x19 = true,
          .x20 = true,
          .x21 = true,
          .x22 = true,
          .x23 = true,
          .x24 = true,
          .x25 = true,
          .x26 = true,
          .x27 = true,
          .x28 = true,
          .x29 = true,
          .lr = true,
          .d8 = true,
          .d9 = true,
          .d10 = true,
          .d11 = true,
          .d12 = true,
          .d13 = true,
          .d14 = true,
          .d15 = true,
          .memory = true,
        });
}

pub fn trampoline() callconv(.naked) noreturn {
    asm volatile (
        \\ mov x0, x19
        \\ mov x29, xzr
        \\ blr x20
        \\ brk #0
    );
}

pub fn initRegs(sp: usize, fiber: *anyopaque, land: usize) Registers {
    return .{ .sp = sp, .lr = @intFromPtr(&trampoline), .x19 = @intFromPtr(fiber), .x20 = land };
}
