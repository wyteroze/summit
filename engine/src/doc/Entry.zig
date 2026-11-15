// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

pub const Kind = enum { module, handle, value, record, variant, @"enum", func, constant, prop, field };
pub const Param = struct { name: []const u8, luau: []const u8, doc: []const u8 = "" };

const Entry = @This();
path: []const u8,
name: []const u8,
kind: Kind,

summary: []const u8 = "",
body: []const u8 = "",
icon: ?[]const u8 = null,
since: ?[]const u8 = null,
deprecated: ?[]const u8 = null,
hidden: bool = false,

// Callables
params: []const Param = &.{},
returns: []const u8 = "()",
returns_doc: []const u8 = "",
is_method: bool = false,
can_throw: bool = false,
injected: []const []const u8 = &.{},

// Properties, fields, and constants
luau: []const u8 = "",
writable: bool = false,
default: ?[]const u8 = null,

// Types. Non-null when the member inherits
inherited_from: ?[]const u8 = null,
