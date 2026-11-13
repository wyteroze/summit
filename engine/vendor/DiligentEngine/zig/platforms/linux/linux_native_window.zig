// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

/// Platform-native handles for creating a Vulkan surface on Linux (XCB, Xlib, Wayland).
///
/// Surface creation selection (in order):
/// - **XCB** (`VK_USE_PLATFORM_XCB_KHR`): use `pXCBConnection` + `WindowId` (both valid) -> `vkCreateXcbSurfaceKHR`.
/// - **Xlib** (`VK_USE_PLATFORM_XLIB_KHR`): use `pDisplay` + `WindowId` (both valid) and no surface yet -> `vkCreateXlibSurfaceKHR`.
/// - **Wayland** (`VK_USE_PLATFORM_WAYLAND_KHR`): use `pDisplay` + `pWaylandSurface` (both valid) and no surface yet -> `vkCreateWaylandSurfaceKHR`.
///
/// Notes:
/// - Populate only the members for the active backend; leave others null/zero.
/// - pDisplay is backend-dependent: `Display*` (Xlib) or `wl_display*` (Wayland).
pub const LinuxNativeWindow = extern struct {
    /// Native window ID for X11 backends (XCB/Xlib). Must be non-zero to create an X11 surface.
    window_id: u32 = 0,

    /// Display handle: `Display*` (Xlib) or `wl_display*` (Wayland).
    display: ?*anyopaque = null,

    /// XCB connection handle: `xcb_connection_t*` (XCB only).
    xcb_connection: ?*anyopaque = null,

    /// Wayland surface handle: `wl_surface*` (Wayland only).
    wayland_surface: ?*anyopaque = null,
};
