// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Zone = @import("Zone.zig");

pub const EventKind = enum {
    zone,
    frame,
};

const Event = @This();
start: i96,
end: i96,
payload: u64,
kind: EventKind,
thread_id: u64,

pub fn jsonStringify(self: Event, writer: *std.json.Stringify) !void {
    try writer.beginObject();

    switch (self.kind) {
        .zone => {
            const location: *const Zone.Location = @ptrFromInt(self.payload);

            // Name
            try writer.objectField("name");
            try writer.write(location.name);
            // Category
            try writer.objectField("cat");
            try writer.write(location.category);
            // Phase
            try writer.objectField("ph");
            try writer.write("X");
            // Timestamp
            try writer.objectField("ts");
            try writer.write(nsToUs(self.start));
            // Duration
            try writer.objectField("dur");
            try writer.write(nsToUs(self.end - self.start));
            // Process ID (not relevant to us)
            try writer.objectField("pid");
            try writer.write(1);
            // Thread ID (not relevant to us yet)
            try writer.objectField("tid");
            try writer.write(self.thread_id);

            try writer.objectField("args");
            try writer.beginObject();
            try writer.objectField("file");
            try writer.write(location.file);
            try writer.objectField("line");
            try writer.write(location.line);
            try writer.endObject();
        },
        .frame => {
            try writer.objectField("name");
            try writer.write("Frame");

            try writer.objectField("cat");
            try writer.write("frame");

            try writer.objectField("ph");
            try writer.write("X");

            try writer.objectField("ts");
            try writer.write(self.start);

            try writer.objectField("dur");
            try writer.write(self.end - self.start);

            try writer.objectField("pid");
            try writer.write(1);

            try writer.objectField("args");
            try writer.beginObject();
            try writer.objectField("frame_number");
            try writer.write(self.payload);
            try writer.endObject();
        },
    }
    try writer.endObject();
}

fn nsToUs(ns: i96) f64 {
    return @as(f64, @floatFromInt(ns)) / 1000.0;
}
