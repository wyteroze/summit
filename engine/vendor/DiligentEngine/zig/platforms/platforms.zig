// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const builtin = @import("builtin");

pub const NativeWindow = switch (builtin.os.tag) {
    .windows => @import("win32/win32_native_window.zig").Win32NativeWindow,
    .linux => if (builtin.abi.isAndroid())
        @import("android/android_native_window.zig").AndroidNativeWindow
    else
        @import("linux/linux_native_window.zig").LinuxNativeWindow,
    .macos => @import("apple/macos_native_window.zig").MacOSNativeWindow,
    .ios => @import("apple/ios_native_window.zig").IOSNativeWindow,
    .visionos => @import("apple/visionos_native_window").VisionOSNativeWindow,
    .emscripten => @import("emscripten/emscripten_native_window").EmscriptenNativeWindow,
    else => @compileError("Unknown platform."),
};
