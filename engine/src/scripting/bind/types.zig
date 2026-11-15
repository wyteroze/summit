// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");

pub const BindError = error{ BadArg, Engine, Destroyed };
pub const Kind = enum { func, constant, prop, signal, value, handle, object, record, variant, module, globals };

/// Piece of documentation with only a name and a description.
/// Only really used for ValueRecipe field documentation.
pub const NamedDoc = struct {
    /// Name of the dod
    name: []const u8,
    /// Description of the doc.
    /// Markdown syntax is supported.
    doc: []const u8,
};

/// Documentation for a function parameter.
pub const ParamDoc = struct {
    /// Name of the parameter
    name: [:0]const u8,
    /// Description of the parameter. Markdown syntax is supported.
    doc: []const u8 = "",
    /// Required when a function takes Lua state directly.
    /// The function's parameters can't be determined, so they must be given manually.
    luau: ?[]const u8 = null,
};

/// A piece of documentation.
pub const Doc = struct {
    /// A short summary, this should be kept to a sentence or two max.
    /// Markdown syntax is supported.
    summary: []const u8 = "",
    /// Body of the documentation. This should be descriptive, and can be however long you like.
    /// Markdown syntax is supported.
    body: []const u8 = "",
    /// Documentation for the function's parameters.
    /// Shouldn't be set if you aren't documenting a function.
    params: []const ParamDoc = &.{},
    /// A description of what the function returns.
    /// Shouldn't be set if you aren't documenting a function.
    /// Markdown syntax is supported.
    returns: []const u8 = "",
    /// Required when a function returns `Pushed`, aka, it has written values
    /// directly to the Lua stack. The function's return value can't be determined,
    /// so it must defined given manually.
    returns_luau: ?[]const u8 = null,
    /// Name of the Lucide icon associated with this documentation.
    /// For instance, documentation for a text file would probably set this to [`file-text`](https://lucide.dev/icons/file-text).
    icon: ?[]const u8 = null,
    /// The version of Summit Engine that this was implemented.
    /// **If you make breaking changes to something, you must reset this to the version the changes were made.**
    since: ?[]const u8 = null,
    /// Description for deprecation, which should include these:
    /// - Version of Summit Engine it was deprecated
    /// - Why it was deprecated
    /// - The replacement for it, if any (Please be nice and provide replacements.
    /// If you can't provide a replacement, explain why.)
    deprecated: ?[]const u8 = null,
    /// Whether this documentation and its attached generated info is hidden.
    hidden: bool = false,
};

pub const Member = struct {
    name: [:0]const u8,
    kind: Kind,
    impl: type,
    docs: Doc = .{},

    pub fn doc(comptime self: Member, comptime d: Doc) Member {
        var m = self;
        m.docs = d;
        return m;
    }
};

pub const Op = union(enum) { auto, member: Member };
pub const Ops = struct {
    add: ?Op = null,
    sub: ?Op = null,
    mul: ?Op = null,
    div: ?Op = null,
    unm: ?Op = null,
    eq: ?Op = null,
    lt: ?Op = null,
    le: ?Op = null,
    len: ?Op = null,
    tostring: ?Op = null,
    index: ?Op = null,
    newindex: ?Op = null,
};

pub const Diag = struct {
    buf: [256]u8 = undefined,
    len: usize = 0,

    pub fn fail(self: *Diag, comptime fmt: []const u8, args: anytype) BindError {
        const out = std.fmt.bufPrint(self.buf[0 .. self.buf.len - 1], fmt, args) catch self.buf[0 .. self.buf.len - 1];
        self.len = out.len;
        self.buf[out.len] = 0;

        return error.BadArg;
    }
    pub fn z(self: *Diag) [:0]const u8 {
        return self.buf[0..self.len :0];
    }
};
