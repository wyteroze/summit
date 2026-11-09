-- Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

return {} :: {
    line: (a: Vec3, b: Vec3, color: Color?, alwaysOnTop: boolean?) -> (),
    ray: (origin: Vec3, dir: Vec3, length: number, color: Color?, alwaysOnTop: boolean?) -> (),
    triangle: (a: Vec3, b: Vec3, c: Vec3, color: Color?, alwaysOnTop: boolean?) -> (),
    arrow: (from: Vec3, to: Vec3, color: Color?, alwaysOnTop: boolean?) -> (),
    circle: (center: Vec3, normal: Vec3, radius: number, color: Color?, alwaysOnTop: boolean?) -> (),
    sphere: (center: Vec3, radius: number, color: Color?, alwaysOnTop: boolean?) -> (),
    box: (center: Vec3, size: Vec3, rotation: Quat, color: Color?, alwaysOnTop: boolean?) -> (),
    axes: (pos: Vec3, rot: Quat, size: number, alwaysOnTop: boolean?) -> ()
}