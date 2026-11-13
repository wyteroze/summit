// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const std = @import("std");
const Translator = @import("translate_c").Translator;

const LazyPath = std.Build.LazyPath;
const Compile = std.Build.Step.Compile;
const Module = std.Build.Module;

pub const Backend = enum {
    gl,
    d3d11,
    d3d12,
    vulkan,

    pub fn toCFlag(self: Backend) []const u8 {
        return switch (self) {
            .gl => "SUMMIT_OPENGL_BACKEND",
            .vulkan => "SUMMIT_VULKAN_BACKEND",
            .d3d11 => "SUMMIT_D3D11_BACKEND",
            .d3d12 => "SUMMIT_D3D12_BACKEND",
        };
    }
};

pub fn targetToCFlag(target: std.Build.ResolvedTarget) []const u8 {
    return switch (target.result.os.tag) {
        .wasi => "PLATFORM_WEB",
        .windows => "PLATFORM_WIN32",
        .macos, .maccatalyst => "PLATFORM_MACOS",
        .ios => "PLATFORM_IOS",
        .tvos => "PLATFORM_TVOS",
        .visionos => "PLATFORM_VISIONOS",
        .linux => "PLATFORM_LINUX",
        else => @panic("This platform is not supported by any existing backends."),
    };
}

// Sources

const primitives_src: []const []const u8 = &.{
    "src/DebugOutput.cpp",
    "src/AlignedMalloc.cpp",
    "src/test.cpp",
};

const basic_platform_src: []const []const u8 = &.{
    "src/BasicFileSystem.cpp",
    "src/BasicPlatformDebug.cpp",
    "src/BasicPlatformMisc.cpp",
    "src/StandardFile.cpp",
};

const common_src: []const []const u8 = &.{
    "src/Array2DTools.cpp",
    "src/BasicFileStream.cpp",
    "src/DataBlobImpl.cpp",
    "src/DefaultRawMemoryAllocator.cpp",
    "src/EngineMemory.cpp",
    "src/FileWrapper.cpp",
    "src/FixedBlockMemoryAllocator.cpp",
    "src/GeometryPrimitives.cpp",
    "src/ImageTools.cpp",
    "src/MemoryFileStream.cpp",
    "src/Serializer.cpp",
    "src/SpinLock.cpp",
    "src/ThreadPool.cpp",
    "src/Timer.cpp",
};

const accessories_src: []const []const u8 = &.{
    "src/ColorConversion.cpp",
    "src/DynamicAtlasManager.cpp",
    "src/SRBMemoryAllocator.cpp",
    "src/GraphicsAccessories.cpp",
};

const engine_src: []const []const u8 = &.{
    "src/APIInfo.cpp",
    "src/BottomLevelASBase.cpp",
    "src/BufferBase.cpp",
    "src/DearchiverBase.cpp",
    "src/DefaultShaderSourceStreamFactory.cpp",
    "src/DeviceContextBase.cpp",
    "src/DeviceMemoryBase.cpp",
    "src/DeviceObjectArchive.cpp",
    "src/EngineFactoryBase.cpp",
    "src/FramebufferBase.cpp",
    "src/GraphicsTypesX.cpp",
    "src/PipelineResourceSignatureBase.cpp",
    "src/PipelineStateBase.cpp",
    "src/PipelineStateCacheBase.cpp",
    "src/PSOSerializer.cpp",
    "src/RenderDeviceBase.cpp",
    "src/ResourceMappingBase.cpp",
    "src/RenderPassBase.cpp",
    "src/ShaderBindingTableBase.cpp",
    "src/SamplerBase.cpp",
    "src/ShaderBase.cpp",
    "src/TextureBase.cpp",
    "src/TopLevelASBase.cpp",
};

const shader_tools_src: []const []const u8 = &.{
    "src/ShaderToolsCommon.cpp",
    "src/GLSLParsingTools.cpp",
    "src/HLSLParsingTools.cpp",
    "src/HLSLTokenizer.cpp",
    "src/GLSLUtils.cpp",
    "src/HLSLUtils.cpp",
    "src/DXCompiler.cpp",
    "src/DXCompilerLibrary.cpp",
};

const spirv_cross_core_src: []const []const u8 = &.{
    "spirv_cfg.cpp",
    "spirv_cross.cpp",
    "spirv_cross_parsed_ir.cpp",
    "spirv_parser.cpp",
};

const vulkan_src: []const []const u8 = &.{
    "src/BufferVkImpl.cpp",
    "src/BufferViewVkImpl.cpp",
    "src/BottomLevelASVkImpl.cpp",
    "src/CommandPoolManager.cpp",
    "src/CommandQueueVkImpl.cpp",
    "src/DescriptorPoolManager.cpp",
    "src/DeviceContextVkImpl.cpp",
    "src/DeviceMemoryVkImpl.cpp",
    "src/DeviceObjectArchiveVk.cpp",
    "src/EngineFactoryVk.cpp",
    "src/FenceVkImpl.cpp",
    "src/FramebufferVkImpl.cpp",
    "src/FramebufferCache.cpp",
    "src/GenerateMipsVkHelper.cpp",
    "src/PipelineLayoutVk.cpp",
    "src/PipelineStateVkImpl.cpp",
    "src/PipelineResourceSignatureVkImpl.cpp",
    "src/PipelineStateCacheVkImpl.cpp",
    "src/QueryManagerVk.cpp",
    "src/QueryVkImpl.cpp",
    "src/RenderDeviceVkImpl.cpp",
    "src/RenderPassVkImpl.cpp",
    "src/RenderPassCache.cpp",
    "src/SamplerVkImpl.cpp",
    "src/DearchiverVkImpl.cpp",
    "src/ShaderVkImpl.cpp",
    "src/ShaderResourceBindingVkImpl.cpp",
    "src/ShaderResourceCacheVk.cpp",
    "src/ShaderVariableManagerVk.cpp",
    "src/ShaderBindingTableVkImpl.cpp",
    "src/SwapChainVkImpl.cpp",
    "src/TextureVkImpl.cpp",
    "src/TextureViewVkImpl.cpp",
    "src/TopLevelASVkImpl.cpp",
    "src/VulkanDynamicHeap.cpp",
    "src/VulkanTypeConversions.cpp",
    "src/VulkanUploadHeap.cpp",
    "src/VulkanUtilities/RenderingInfoWrapper.cpp",
    "src/VulkanUtilities/CommandBuffer.cpp",
    "src/VulkanUtilities/CommandBufferPool.cpp",
    "src/VulkanUtilities/Debug.cpp",
    "src/VulkanUtilities/Instance.cpp",
    "src/VulkanUtilities/LogicalDevice.cpp",
    "src/VulkanUtilities/MemoryManager.cpp",
    "src/VulkanUtilities/PhysicalDevice.cpp",
    "src/VulkanUtilities/SyncObjectManager.cpp",
};

const gl_src: []const []const u8 = &.{
    "src/BufferGLImpl.cpp",
    "src/BufferViewGLImpl.cpp",
    "src/DeviceContextGLImpl.cpp",
    "src/DeviceObjectArchiveGL.cpp",
    "src/DearchiverGLImpl.cpp",
    "src/EngineFactoryOpenGL.cpp",
    "src/FBOCache.cpp",
    "src/FenceGLImpl.cpp",
    "src/FramebufferGLImpl.cpp",
    "src/GLContextState.cpp",
    "src/GLObjectWrapper.cpp",
    "src/GLProgram.cpp",
    "src/GLProgramCache.cpp",
    "src/GLTypeConversions.cpp",
    "src/PipelineResourceSignatureGLImpl.cpp",
    "src/PipelineStateGLImpl.cpp",
    "src/QueryGLImpl.cpp",
    "src/RenderDeviceGLImpl.cpp",
    "src/RenderPassGLImpl.cpp",
    "src/SamplerGLImpl.cpp",
    "src/ShaderGLImpl.cpp",
    "src/ShaderResourceBindingGLImpl.cpp",
    "src/ShaderResourceCacheGL.cpp",
    "src/ShaderResourcesGL.cpp",
    "src/ShaderVariableManagerGL.cpp",
    "src/Texture1D_GL.cpp",
    "src/Texture1DArray_GL.cpp",
    "src/Texture2D_GL.cpp",
    "src/Texture2DArray_GL.cpp",
    "src/Texture3D_GL.cpp",
    "src/TextureBaseGL.cpp",
    "src/TextureCube_GL.cpp",
    "src/TextureCubeArray_GL.cpp",
    "src/TextureViewGLImpl.cpp",
    "src/VAOCache.cpp",
    "src/SwapChainGLImpl.cpp",
};

const Spec = struct {
    name: []const u8,
    /// Relative to DiligentCore/
    dir: []const u8,
    /// Relative to `dir`
    cpp: []const []const u8 = &.{},
    objcpp: []const []const u8 = &.{},
    c: []const []const u8 = &.{},
    /// Relative to DiligentCore/
    includes: []const []const u8 = &.{},
    extra_includes: []const LazyPath = &.{},
    defines: []const [2][]const u8 = &.{},
    flags: []const []const u8 = &.{},
};

const Ctx = struct {
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    backend: Backend,
    root: LazyPath,
    libs: std.ArrayList(*Compile) = .empty,

    fn os(c: *const Ctx) std.Target.Os.Tag {
        return c.target.result.os.tag;
    }

    fn platformDir(c: *const Ctx) []const u8 {
        return switch (c.os()) {
            .windows => "Win32",
            .linux => "Linux",
            .macos => "Apple",
            else => @panic("Unsupported OS for this build script"),
        };
    }

    fn applyCommon(c: *Ctx, mod: *Module) void {
        const b = c.b;

        const inc = [_][]const u8{
            "Primitives/interface",
            "Platforms/interface",
            "Platforms/Basic/interface",
            "Common/interface",
            "Graphics/GraphicsAccessories/interface",
            "Graphics/GraphicsEngine/interface",
            "Graphics/GraphicsEngine/include",
            "Graphics/ShaderTools/include",
            "ThirdParty/DirectXShaderCompiler",
        };
        for (inc) |p| mod.addIncludePath(c.root.path(b, p));
        mod.addIncludePath(c.root.path(b, b.fmt("Platforms/{s}/interface", .{c.platformDir()})));
        if (c.os() == .macos) mod.addIncludePath(c.root.path(b, "Platforms/Linux/interface"));

        if (c.backend == .vulkan) {
            mod.addIncludePath(c.root.path(b, "ThirdParty/SPIRV-Cross"));
            mod.addIncludePath(c.root.path(b, "ThirdParty/SPIRV-Headers/include"));
            mod.addCMacro("DILIGENT_SPIRV_CROSS_NAMESPACE", "diligent_spirv_cross");
            mod.addCMacro("SPIRV_CROSS_NAMESPACE_OVERRIDE", "diligent_spirv_cross");
        }

        switch (c.os()) {
            .windows => mod.addCMacro("PLATFORM_WIN32", "1"),
            .linux => mod.addCMacro("PLATFORM_LINUX", "1"),
            .macos => {
                mod.addCMacro("PLATFORM_MACOS", "1");
                mod.addCMacro("PLATFORM_APPLE", "1");
            },
            else => unreachable,
        }

        const be = c.backend;
        mod.addCMacro("D3D11_SUPPORTED", if (be == .d3d11) "1" else "0");
        mod.addCMacro("D3D12_SUPPORTED", if (be == .d3d12) "1" else "0");
        mod.addCMacro("GL_SUPPORTED", if (be == .gl) "1" else "0");
        mod.addCMacro("GLES_SUPPORTED", "0");
        mod.addCMacro("VULKAN_SUPPORTED", if (be == .vulkan) "1" else "0");
        mod.addCMacro("METAL_SUPPORTED", "0");
        mod.addCMacro("WEBGPU_SUPPORTED", "0");

        if (c.optimize == .debug) {
            mod.addCMacro("DILIGENT_DEVELOPMENT", "1");
            mod.addCMacro("DILIGENT_DEBUG", "1");
            mod.addCMacro("_DEBUG", "1");
            mod.addCMacro("DEBUG", "1");
        }

        if (c.os() != .windows) mod.addCMacro("__forceinline", "inline");
    }

    fn vulkanPlatformDefine(c: *const Ctx) []const u8 {
        return switch (c.os()) {
            .windows => "VK_USE_PLATFORM_WIN32_KHR",
            .linux => "VK_USE_PLATFORM_XLIB_KHR",
            .macos => "VK_USE_PLATFORM_METAL_EXT",
            else => unreachable,
        };
    }

    fn add(c: *Ctx, s: Spec) *Compile {
        const b = c.b;
        const mod = b.createModule(.{
            .target = c.target,
            .optimize = c.optimize,
            .link_libcpp = true,
        });

        const dir = c.root.path(b, s.dir);
        for (s.includes) |p| mod.addIncludePath(c.root.path(b, p));
        for (s.extra_includes) |p| mod.addIncludePath(p);
        c.applyCommon(mod);
        for (s.defines) |d| mod.addCMacro(d[0], d[1]);

        const cxx_flags = std.mem.concat(b.allocator, []const u8, &.{
            &.{ "-std=c++17", "-fno-sanitize=undefined" },
            s.flags,
        }) catch @panic("OOM");
        const c_flags = std.mem.concat(b.allocator, []const u8, &.{
            &.{"-fno-sanitize=undefined"},
            s.flags,
        }) catch @panic("OOM");

        if (s.cpp.len > 0) mod.addCSourceFiles(.{ .root = dir, .files = s.cpp, .flags = cxx_flags, .language = .cpp });
        if (s.objcpp.len > 0) mod.addCSourceFiles(.{ .root = dir, .files = s.objcpp, .flags = cxx_flags, .language = .objective_cpp });
        if (s.c.len > 0) mod.addCSourceFiles(.{ .root = dir, .files = s.c, .flags = c_flags, .language = .c });

        const lib = b.addLibrary(.{ .name = s.name, .root_module = mod, .linkage = .static });
        c.libs.append(b.allocator, lib) catch @panic("OOM");
        return lib;
    }
};

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const dep_translate_c = b.dependency("translate_c", .{});

    const backend = b.option(Backend, "backend", "Backend to use\n(default: vulkan)") orelse .vulkan;

    if (backend == .d3d11 or backend == .d3d12) {
        @panic("Direct3D11/12 haven't been ported to the build.zig yet. Use -Dbackend=vulkan in the meantime.");
    }

    var c: Ctx = .{
        .b = b,
        .target = target,
        .optimize = optimize,
        .backend = backend,
        .root = b.path("src/DiligentCore"),
    };
    const os = c.os();

    _ = c.add(.{
        .name = "Diligent-Primitives",
        .dir = "Primitives",
        .cpp = primitives_src,
    });
    _ = c.add(.{
        .name = "Diligent-BasicPlatform",
        .dir = "Platforms/Basic",
        .cpp = basic_platform_src,
        .includes = &.{"Platforms/Basic/include"},
    });

    switch (os) {
        .linux => _ = c.add(.{
            .name = "Diligent-LinuxPlatform",
            .dir = "Platforms/Linux",
            .cpp = &.{ "src/LinuxDebug.cpp", "src/LinuxFileSystem.cpp", "src/LinuxPlatformMisc.cpp" },
        }),
        .macos => _ = c.add(.{
            .name = "Diligent-ApplePlatform",
            .dir = "Platforms/Apple",
            .cpp = &.{ "src/ApplePlatformMisc.cpp", "../Linux/src/LinuxFileSystem.cpp" },
            .objcpp = &.{ "src/AppleDebug.mm", "src/AppleFileSystem.mm", "src/MacOSNativeWindow.mm" },
        }),
        .windows => _ = c.add(.{
            .name = "Diligent-Win32Platform",
            .dir = "Platforms/Win32",
            .cpp = &.{ "src/Win32Debug.cpp", "src/Win32FileSystem.cpp", "src/Win32PlatformMisc.cpp" },
        }),
        else => unreachable,
    }

    _ = c.add(.{ .name = "Diligent-Common", .dir = "Common", .cpp = common_src, .includes = &.{"Common/include"} });
    _ = c.add(.{ .name = "Diligent-GraphicsAccessories", .dir = "Graphics/GraphicsAccessories", .cpp = accessories_src });

    const commit_define: []const [2][]const u8 = &.{};
    _ = c.add(.{ .name = "Diligent-GraphicsEngine", .dir = "Graphics/GraphicsEngine", .cpp = engine_src, .defines = commit_define });

    // ShaderTools
    {
        // TODO: Port the script over to Zig so we don't need python.
        const gen = b.addSystemCommand(&.{"python3"});
        gen.addFileArg2(c.root.path(b, "BuildTools/File2Include/script.py"), .{});
        gen.addFileArg2(c.root.path(b, "Graphics/ShaderTools/include/HLSLDefinitions.fxh"), .{});
        const hlsl_inc = gen.addOutputFileArg2("HLSLDefinitions_inc.fxh", .{});
        gen.addArg("--strip-comments");

        var list: std.ArrayList([]const u8) = .empty;
        try list.appendSlice(b.allocator, shader_tools_src);
        switch (os) {
            .windows => try list.append(b.allocator, "src/DXCompilerLibraryWin32.cpp"),
            .linux => try list.append(b.allocator, "src/DXCompilerLibraryLinux.cpp"),
            .macos => try list.append(b.allocator, "src/DXCompilerLibraryMacOS.cpp"),
            else => unreachable,
        }
        if (os != .windows) try list.append(b.allocator, "../../ThirdParty/DirectXShaderCompiler/dxc/Support/WinAdapter.cpp");
        if (backend == .vulkan) {
            try list.append(b.allocator, "src/SPIRVShaderResources.cpp");
            try list.append(b.allocator, "src/SPIRVUtils.cpp");
        }

        _ = c.add(.{
            .name = "Diligent-ShaderTools",
            .dir = "Graphics/ShaderTools",
            .cpp = list.items,
            .includes = &.{"Graphics/GraphicsEngine/include"},
            .extra_includes = &.{hlsl_inc.dirname()},
            .defines = &.{.{ "DILIGENT_NO_HLSL", "1" }},
            .flags = &.{"-fms-extensions"},
        });
    }

    // Backend specific
    switch (backend) {
        .vulkan => {
            _ = c.add(.{
                .name = "spirv-cross-core",
                .dir = "ThirdParty/SPIRV-Cross",
                .cpp = spirv_cross_core_src,
            });

            _ = c.add(.{
                .name = "volk",
                .dir = "ThirdParty/volk",
                .c = &.{"volk.c"},
                .includes = &.{"ThirdParty/Vulkan-Headers/include"},
                .defines = &.{.{ c.vulkanPlatformDefine(), "1" }},
            });

            _ = c.add(.{
                .name = "Diligent-GraphicsEngineVk",
                .dir = "Graphics/GraphicsEngineVulkan",
                .cpp = vulkan_src,
                .includes = &.{
                    "Graphics/GraphicsEngineVulkan/include",
                    "Graphics/GraphicsEngineVulkan/interface",
                    "Graphics/GraphicsEngineNextGenBase/include",
                    "ThirdParty/volk",
                    "ThirdParty/Vulkan-Headers/include",
                },
                .defines = &.{
                    .{ "DILIGENT_USE_VOLK", "1" },
                    .{ "DILIGENT_NO_GLSLANG", "1" },
                    .{ "DILIGENT_NO_HLSL", "1" },
                    .{ c.vulkanPlatformDefine(), "1" },
                    .{ "NOMINMAX", "1" },
                },
            });
        },
        .gl => {
            _ = c.add(.{
                .name = "glew",
                .dir = "ThirdParty/glew",
                .c = &.{"src/glew.c"},
                .includes = &.{"ThirdParty/glew/include"},
                .defines = &.{.{ "GLEW_STATIC", "1" }},
            });

            var list: std.ArrayList([]const u8) = .empty;
            try list.appendSlice(b.allocator, gl_src);
            var objcpp: []const []const u8 = &.{};
            switch (os) {
                .windows => try list.append(b.allocator, "src/GLContextWindows.cpp"),
                .linux => try list.append(b.allocator, "src/GLContextLinux.cpp"),
                .macos => objcpp = &.{"src/GLContextMacOS.mm"},
                else => unreachable,
            }

            _ = c.add(.{
                .name = "Diligent-GraphicsEngineOpenGL",
                .dir = "Graphics/GraphicsEngineOpenGL",
                .cpp = list.items,
                .objcpp = objcpp,
                .includes = &.{
                    "Graphics/GraphicsEngineOpenGL/include",
                    "Graphics/GraphicsEngineOpenGL/interface",
                    "ThirdParty/glew/include",
                },
                .defines = &.{
                    .{ "GLEW_STATIC", "1" },
                    .{ "DILIGENT_NO_HLSL", "1" },
                    .{ "GL_SILENCE_DEPRECATION", "1" },
                },
            });
        },
        else => unreachable,
    }

    const tc: Translator = .init(dep_translate_c, .{
        .name = "Translate diligent",
        .c_source_file = b.path("zig/diligent_c.h"),
        .target = target,
        .optimize = optimize,
    });
    tc.defineCMacro(backend.toCFlag(), null);
    tc.defineCMacro(targetToCFlag(target), "1");
    tc.addIncludePath(b.path("src"));
    tc.mod.link_libcpp = true;

    for (c.libs.items) |lib| tc.mod.linkLibrary(lib);

    switch (os) {
        .macos => {
            tc.mod.linkFramework("AppKit", .{});
            tc.mod.linkFramework("Foundation", .{});
            tc.mod.linkFramework("CoreFoundation", .{});
            if (backend == .gl) tc.mod.linkFramework("OpenGL", .{});
        },
        .linux => {
            tc.mod.linkSystemLibrary("dl", .{});
            if (backend == .gl) {
                tc.mod.linkSystemLibrary("GL", .{});
                tc.mod.linkSystemLibrary("X11", .{});
            }
        },
        .windows => {
            tc.mod.linkSystemLibrary("shlwapi", .{});
            if (backend == .gl) tc.mod.linkSystemLibrary("opengl32", .{});
        },
        else => unreachable,
    }

    _ = b.addModule("diligent", .{
        .root_source_file = b.path("zig/diligent.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "c", .module = tc.mod },
        },
    });
}
