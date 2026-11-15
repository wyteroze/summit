// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Translator = @import("translate_c").Translator;
const diligent_vendor = @import("diligent_engine");

// The newlines are needed for these headers so concatenating doesn't break them
const assimp_headers =
    \\#include "assimp/cimport.h"
    \\#include "assimp/scene.h"
    \\#include "assimp/postprocess.h"
    \\
;

const freetype_headers =
    \\#include "ft2build.h"
    \\#include FT_FREETYPE_H
    \\#include FT_MODULE_H
    \\
;

const dr_libs_headers =
    \\#include "dr_mp3.h"
    \\#include "dr_wav.h"
    \\
;

const dr_libs_impl =
    \\#define DR_MP3_IMPLEMENTATION
    \\#include "dr_mp3.h"
    \\#define DR_WAV_IMPLEMENTATION
    \\#include "dr_wav.h"
    \\
;

// These 3 following headers are specifically for
// implementations of each backend in os/backends/*os name*.
// Headers for other reasons most likely have a better place
// (though I couldn't tell you where, maybe just create a new place for it)
const windows_c_headers =
    \\
;

const darwin_c_headers =
    // Scheduling
    \\#include <sys/sysctl.h>
    \\#include <pthread.h>
    \\
;

const linux_c_headers =
    // Scheduling
    \\#include <sched.h>
    \\#include <sys/resource.h>
    \\#include <unistd.h>
    \\#include <sys/syscall.h>
    \\
;

// For Apple platforms
const SdkPaths = struct {
    frameworks: []const u8,
    includes: []const u8,
    libs: []const u8,

    fn resolve(b: *std.Build, sdk_path: ?[]const u8) ?SdkPaths {
        const path = sdk_path orelse return null;
        return .{ .frameworks = b.pathJoin(&.{ path, "System", "Library", "Frameworks" }), .includes = b.pathJoin(&.{ path, "usr", "include" }), .libs = b.pathJoin(&.{ "/", "usr", "lib" }) };
    }

    fn applyToTranslator(self: SdkPaths, translator: Translator) void {
        translator.addIncludePath(.{ .cwd_relative = self.includes });
        translator.addFrameworkPath(.{ .cwd_relative = self.frameworks });
    }

    fn applyToModule(self: SdkPaths, module: *std.Build.Module) void {
        module.addFrameworkPath(.{ .cwd_relative = self.frameworks });
        module.addIncludePath(.{ .cwd_relative = self.includes });
        module.addLibraryPath(.{ .cwd_relative = self.libs });
    }
};

fn dependencyStep(dependency: *std.Build.Dependency, step_name: []const u8) *std.Build.Step {
    const found = dependency.builder.top_level_steps.get(step_name) orelse {
        std.debug.panic("dependency '{f}' has no top-level step named '{s}'", .{ dependency.builder.path("build.zig"), step_name });
    };

    return &found.step;
}

// There is like a 99% chance this does not compile on anything other than mac because of missing libraries
// It shouldn't be too hard to fix though. I'm just focused on the engine for now
pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const sdk_path = b.option([]const u8, "sdk", "Path to macOS SDK (looks something like MacOSX26.5.sdk)") orelse std.zig.system.darwin.getSdk(b.allocator, b.graph.io, &target.result);
    const sdk: ?SdkPaths = .resolve(b, sdk_path);
    // TODO: Allow enabling multiple backends
    const backend = b.option(diligent_vendor.Backend, "backend", "Backend to use\n(default: vulkan)") orelse .vulkan;

    const dep_sdl3 = b.dependency("sdl3", .{ .target = target, .optimize = optimize, .ext_mixer = true });
    const dep_zlua = b.dependency("zlua", .{ .target = target, .optimize = optimize, .lang = .luau });
    const dep_toml = b.dependency("toml", .{ .target = target, .optimize = optimize });
    const dep_zigimg = b.dependency("zigimg", .{ .target = target, .optimize = optimize });
    const dep_translate_c = b.dependency("translate_c", .{});
    const dep_diligent = b.dependency("diligent_engine", .{ .target = target, .optimize = optimize });
    const dep_freetype = b.dependency("freetype", .{ .target = target, .optimize = optimize });
    const dep_dr_libs = b.dependency("dr_libs", .{});
    const dep_assimp = b.dependency("zig_assimp", .{ .target = target, .optimize = optimize, .formats = "STL,Obj,FBX,glTF,glTF2", .double = false, .zlib = false });
    const dep_zphysics = b.dependency("zphysics", .{});
    const dep_zslang = b.dependency("zslang", .{ .target = target, .optimize = .fast });

    const os_headers = switch (target.result.os.tag) {
        .windows => windows_c_headers,
        .macos, .ios, .tvos, .watchos, .visionos, .maccatalyst => darwin_c_headers,
        .linux => linux_c_headers,

        else => @panic("This platform is not supported by any existing backends."),
    };

    const c_src = b.addWriteFiles();
    const assimp_h = c_src.add("assimp.h", assimp_headers);
    const freetype_h = c_src.add("freetype.h", freetype_headers);
    const wrapper_h = c_src.add("wrapper.h", os_headers);
    const dr_libs_h = c_src.add("dr_libs.h", dr_libs_headers);
    const dr_libs_c = c_src.add("dr_libs_impl.c", dr_libs_impl);

    const translator: Translator =
        .init(dep_translate_c, .{
            .name = "Translate system headers",
            .c_source_file = wrapper_h,
            .target = target,
            .optimize = optimize,
        });
    const assimp_translator: Translator =
        .init(dep_translate_c, .{
            .name = "Translate assimp",
            .c_source_file = assimp_h,
            .target = target,
            .optimize = optimize,
        });
    const freetype_translator: Translator =
        .init(dep_translate_c, .{
            .name = "Translate freetype",
            .c_source_file = freetype_h,
            .target = target,
            .optimize = optimize,
        });
    const dr_libs_translator: Translator =
        .init(dep_translate_c, .{
            .name = "Translate dr_libs",
            .c_source_file = dr_libs_h,
            .target = target,
            .optimize = optimize,
        });

    // Options exposed to the engine
    const engine_options = b.addOptions();
    engine_options.addOption(diligent_vendor.Backend, "backend", backend);

    const engine_mod = b.addModule("engine", .{
        .root_source_file = b.path("src/engine.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "sdl3", .module = dep_sdl3.module("sdl3") },
            .{ .name = "zlua", .module = dep_zlua.module("zlua") },
            .{ .name = "toml", .module = dep_toml.module("toml") },
            .{ .name = "zigimg", .module = dep_zigimg.module("zigimg") },
            .{ .name = "zphysics", .module = dep_zphysics.module("root") },
            .{ .name = "c", .module = translator.mod },
            .{ .name = "assimp", .module = assimp_translator.mod },
            .{ .name = "slang", .module = dep_zslang.module("slang") },
            .{ .name = "freetype", .module = freetype_translator.mod },
            .{ .name = "dr_libs", .module = dr_libs_translator.mod },
            .{ .name = "diligent", .module = dep_diligent.module("diligent") },
        },
    });
    engine_mod.addOptions("build_options", engine_options);

    const engine_lib = b.addLibrary(.{
        .name = "engine",
        .root_module = engine_mod,
        .linkage = .static,
    });

    // Assimp
    const lib_assimp = dep_assimp.artifact("assimp");
    engine_mod.linkLibrary(lib_assimp);
    assimp_translator.addIncludePath(lib_assimp.getEmittedIncludeTree());

    // Freetype
    const lib_freetype = dep_freetype.artifact("freetype");
    engine_mod.linkLibrary(lib_freetype);
    freetype_translator.addIncludePath(lib_freetype.getEmittedIncludeTree());

    // zslang
    b.installDirectory(.{
        .source_dir = dep_zslang.namedLazyPath("slang-runtime-dir"),
        .install_dir = if (target.result.os.tag == .windows) .bin else .lib,
        .install_subdir = "",
    });

    // dr_libs
    dr_libs_translator.addIncludePath(dep_dr_libs.path(""));
    engine_mod.addCSourceFile(.{ .file = dr_libs_c, .language = .c });
    engine_mod.addIncludePath(dep_dr_libs.path(""));

    // zphysics
    engine_mod.linkLibrary(dep_zphysics.artifact("joltc"));

    if (target.result.os.tag == .macos and sdk != null) {
        sdk.?.applyToTranslator(translator);
        sdk.?.applyToTranslator(assimp_translator);
        sdk.?.applyToTranslator(freetype_translator);
        sdk.?.applyToModule(engine_mod);

        engine_mod.linkFramework("CoreVideo", .{});
        engine_mod.linkFramework("Cocoa", .{});
        engine_mod.linkFramework("OpenGL", .{});
        engine_mod.linkFramework("IOKit", .{});
        engine_mod.linkFramework("CoreServices", .{});
        engine_mod.linkFramework("CoreGraphics", .{});
        engine_mod.linkFramework("CoreText", .{});

        // Link zlib for assimp
        lib_assimp.root_module.addFrameworkPath(.{ .cwd_relative = sdk.?.frameworks });
        lib_assimp.root_module.addLibraryPath(.{ .cwd_relative = sdk.?.libs });
        lib_assimp.root_module.linkSystemLibrary("z", .{});
    }

    b.installArtifact(engine_lib);

    const test_artifact = b.addTest(.{ .root_module = engine_mod });
    const run_test_cmd = b.addRunArtifact(test_artifact);
    run_test_cmd.step.dependOn(b.getInstallStep());

    const test_step = b.step("test", "Test the engine");
    test_step.dependOn(&run_test_cmd.step);

    // Docs
    const docs_mod = b.addModule("docs", .{
        .root_source_file = b.path("src/doc/gen.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "engine", .module = engine_mod },
        },
    });
    const docs_lib = b.addExecutable(.{
        .name = "docs",
        .root_module = docs_mod,
    });

    const run_docs_cmd = b.addRunArtifact(docs_lib);
    run_docs_cmd.addPassthruArgs();
    const docs_step = b.step("docs", "Generate docs");
    docs_step.dependOn(&run_docs_cmd.step);
}
