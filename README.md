<p align="center">
  <img src="misc/SummitWordmark.svg" alt="Summit Engine logo" width = 400>
</p>

## About

Summit Engine is a cross-platform game engine prioritizing both simplicity and power.
Beyond running on multiple platforms, it also makes it easy to adapt your game to different
form factors, input types and hardware configurations/restrictions.

Summit is fully free and open-source under the Apache-2.0 license. 

### Status

Summit is still in very early development. Some of what you'd expect from a game engine is present,
but it's not fully developed, and many important pieces are still missing.

**Zig/Luau version**: Summit is written in Zig, and it uses Luau for scripting.
As these are rapidly changing languages, Summit does not keep up with them.
Zig is kept up to the latest stable release, and Luau is updated around monthly 
or sooner if a new major feature is released.

### Goals

* **Cross platform**: Aims to let you export your game to desktop, mobile, and web. 
Adapt your game to countless devices easily.
* **Simple**: Easy to start with, complexity stays out of your way unless you need it.
* **Scripting**: Luau, plus a C API planned.
* **3D/2D**: Only 3D is supported at the moment, but dedicated 2D is planned.
* **ECS**: Data-oriented architecture and scripting API.

## Roadmap

These items aren't guaranteed, and priorities may change down the road.

### Next
- Renderer improvements: more control over lighting and textures, custom render passes
- Less object-oriented, more data-oriented scripting API
- Additional platforms: Linux, Windows, iOS, Android, Web

### Later
- Editor (needed to decouple asset processing from the base runtime, unblocking platforms like web/mobile)
- Input actions and gamepad/touch support
- Multithreading, profiling, and performance work
- IO, HTTP, and file scripting APIs
- Audio improvements: effects, buses, audio graph
- Video support
- Particle and animation systems
- C API and dedicated 2D

### Ideas
- Asset system overhaul
- Runtime modularization
- Compiling Luau to true native code (very experimental)

## Getting started

> [!NOTE]
> macOS is only the currently supported OS, and aarch64/x86_64 are the only currently supported architectures.
> This will change very soon in the future, and it's very easy to add new OS/arch support yourself if you want to contribute.

1. Install latest stable version of Zig (https://ziglang.org/download/)
2. Clone and open the repo (`git clone https://github.com/wyteroze/summit.git`, then `cd summit`)
3. Run the build command with your needed target and backend (example: `zig build -Dbackend=vulkan` and optionally add a target: `-Dtarget=aarch64-macos`)
4. Run the executable and provide a path to a folder containing a `Summit.toml` file (example: `./zig-out/bin/summit --project=demos/example`)
5. Done

## Software Licenses
* **Summit**: [Apache-2.0](https://github.com/wyteroze/summit/blob/main/LICENSE)
* **Zig**: [MIT](https://codeberg.org/ziglang/zig/src/branch/master/LICENSE)
* **Diligent Engine**: [Apache-2.0](https://github.com/DiligentGraphics/DiligentEngine/blob/master/License.txt)
* **Slang**: [Apache-2.0 WITH LLVM-exception](https://github.com/shader-slang/slang/blob/master/LICENSE)
* **Lua**: [MIT](https://www.lua.org/license.html)
* **Luau**: [MIT](https://github.com/luau-lang/luau/blob/master/LICENSE.txt)
* **FreeType**: [FTL](https://gitlab.freedesktop.org/freetype/freetype/-/blob/master/docs/FTL.TXT)
* **SDL3**: [Zlib](https://www.libsdl.org/license.php)
* **dr_libs**: [MIT-0](https://github.com/mackron/dr_libs/blob/master/LICENSE)
* **assimp**: [BSD-3-Clause](https://github.com/assimp/assimp/blob/master/LICENSE)
* **Jolt Physics**: [MIT](https://github.com/jrouwe/JoltPhysics/blob/master/LICENSE)
* **zigimg**: [MIT](https://github.com/zigimg/zigimg/blob/master/LICENSE)
* **ziglua**: [MIT](https://github.com/natecraddock/ziglua/blob/main/license)
* **zphysics**: [MIT](https://github.com/zig-gamedev/zphysics/blob/main/LICENSE)
* **zig-toml**: [MIT](https://github.com/sam701/zig-toml/blob/main/LICENSE)
* **zig-assimp**: [BSD-3-Clause](https://github.com/allyourcodebase/assimp/blob/master/LICENCE)
* **zig-sdl3**: [MIT](https://codeberg.org/7Games/zig-sdl3/src/branch/master/LICENSE)
