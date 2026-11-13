// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

const c = @import("c");
const types = @import("types.zig");
const graphics = @import("../graphics.zig");
const primitives = @import("../../primitives/primitives.zig");
const platforms = @import("../../platforms/platforms.zig");
const helpers = @import("../../helpers.zig");

pub const CreateInfo = types.EngineVkCreateInfo;
pub const Factory = EngineFactoryVk;

pub const EngineFactoryVk = struct {
    raw: *c.IEngineFactoryVk,

    /// Creates a render device and device contexts for Vulkan backend
    pub fn createDeviceAndContexts(
        self: EngineFactoryVk,
        create_info: CreateInfo,
    ) !struct { graphics.RenderDevice, graphics.DeviceContext } {
        var device: [*c]c.IRenderDevice = null;
        var contexts: [1]?*c.IDeviceContext = .{null};

        self.method("CreateDeviceAndContextsVk")(
            self.raw,
            create_info.toC(),
            &device,
            @ptrCast(&contexts),
        );

        if (device == null) return error.DeviceCreationFailed;
        const immediate = contexts[0] orelse return error.ContextsCreationFailed;

        return .{
            .{ .raw = device.? },
            .{ .raw = immediate },
        };
    }

    /// Creates a swap chain for Vulkan-based engine implementation
    pub fn createSwapchain(
        self: EngineFactoryVk,
        device: graphics.RenderDevice,
        immediate_context: graphics.DeviceContext,
        swapchain_desc: types.SwapchainDesc,
        window: platforms.NativeWindow,
    ) !graphics.Swapchain {
        var swapchain: [*c]c.ISwapChain = null;

        self.method("CreateSwapChainVk")(
            self.raw,
            device.raw,
            immediate_context.raw,
            @ptrCast(&swapchain_desc),
            @ptrCast(&window),
            &swapchain,
        );

        if (swapchain == null) return error.SwapchainCreationFailed;

        return .{ .raw = swapchain.? };
    }

    /// Vulkan instance will be created with the device simulation layer.
    /// Use VK_DEVSIM_FILENAME environment variable to define the path to the .json file.
    ///
    /// **Remarks:** Use this function before calling EnumerateAdapters() and CreateDeviceAndContextsVk().
    pub fn enableDeviceSimulation(self: EngineFactoryVk) void {
        self.method("EnableDeviceSimulation")(self.raw);
    }

    /// Returns the supported Vulkan version. If Vulkan is not supported, returns `VulkanNotSupported`
    /// This function can be used to check whether Vulkan is supported on the platform.
    pub fn getVulkanVersion(self: EngineFactoryVk) error{VulkanNotSupported}!types.Version {
        const version: *const types.Version = @ptrCast(self.method("GetVulkanVersion")(self.raw));
        if (version.major == 0 and version.minor == 0) return error.VulkanNotSupported;

        return version.*;
    }

    pub const method = helpers.methodHelper(@This(), "EngineFactoryVk");
    pub const asBase = helpers.baseHelper(EngineFactoryVk, graphics.EngineFactory);
    pub const fromBase = helpers.baseHelper(graphics.EngineFactory, EngineFactoryVk);
};

/// If an allocator is passed as the first argument, it will be set as the factory's allocator.
/// Note that the allocator must stay alive for the lifetime of the factory.
pub fn loadAndGetFactory(maybe_allocator: ?*primitives.MemoryAllocator.ZigAllocator) !EngineFactoryVk {
    const f = c.Diligent_LoadAndGetEngineFactoryVk() orelse return error.FactoryUnavailable;
    if (maybe_allocator) |allocator| {
        (graphics.EngineFactory{ .raw = @ptrCast(f) }).setMemoryAllocator(allocator.memoryAllocator());
    }

    return .{ .raw = f };
}
