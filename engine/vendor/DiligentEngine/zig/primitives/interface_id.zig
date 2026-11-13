// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

pub const InterfaceID = extern struct {
    data_1: u32,
    data_2: u16,
    data_3: u16,
    data_4: [8]u8,

    pub fn eq(self: *const InterfaceID, other: *const InterfaceID) bool {
        return self.data_1 == other.data_1 and
            self.data_2 == other.data_2 and
            self.data_3 == other.data_3 and
            std.mem.eql(u8, self.data_4, other.data_4);
    }

    pub fn neq(self: *const InterfaceID, other: *const InterfaceID) bool {
        return !self.eq(other);
    }
};
