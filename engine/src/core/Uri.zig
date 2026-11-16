// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.
//! Uniform resource identifier. The hierarchal part is always `//`
//! The scheme is everything before the first `://`, and the path is everything after.

const std = @import("std");
const uri_sep = "://";

const Uri = @This();
/// Scheme of the URI
scheme: []const u8,
/// Path of the URI
path: []const u8,

/// Parses a URI string. This only takes a slice of the string, so the string must stay alive
/// for as long as this does.
pub fn parse(uri: []const u8) !Uri {
    const idx = std.mem.find(u8, uri, uri_sep) orelse return error.InvalidUri;

    const scheme = uri[0..idx];
    const path = uri[idx + uri_sep.len ..];

    return .{ .scheme = scheme, .path = path };
}
