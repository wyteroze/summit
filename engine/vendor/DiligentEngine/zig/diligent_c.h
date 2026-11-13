// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

#define DILIGENT_C_INTERFACE 1

#include "DiligentCore/Graphics/GraphicsEngine/interface/Buffer.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/DeviceContext.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/GraphicsTypes.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/InputLayout.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/PipelineState.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/RenderDevice.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/Sampler.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/Shader.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/ShaderResourceBinding.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/SwapChain.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/Texture.h"
#include "DiligentCore/Graphics/GraphicsEngine/interface/TextureView.h"

#if defined(SUMMIT_D3D11_BACKEND)
#include "DiligentCore/Graphics/GraphicsEngineD3D11/interface/EngineFactoryD3D11.h"
#elif defined(SUMMIT_D3D12_BACKEND)
#include "DiligentCore/Graphics/GraphicsEngineD3D12/interface/EngineFactoryD3D12.h"
#elif defined(SUMMIT_OPENGL_BACKEND)
#include "DiligentCore/Graphics/GraphicsEngineOpenGL/interface/EngineFactoryOpenGL.h"
#elif defined(SUMMIT_VULKAN_BACKEND)
#include "DiligentCore/Graphics/GraphicsEngineVulkan/interface/EngineFactoryVk.h"
#endif

#if defined(PLATFORM_MACOS)
#include "DiligentCore/Platforms/Apple/interface/MacOSNativeWindow.h"
#elif defined(PLATFORM_WIN32)
#include "DiligentCore/Platforms/Win32/interface/Win32NativeWindow.h"
#endif