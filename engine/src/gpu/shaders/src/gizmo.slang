// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

struct VsParams {
    float4x4 view;
    float4x4 proj;
};
ConstantBuffer<VsParams> vsParams;

struct VsIn { float3 position : POSITION; float4 color : COLOR; };
struct VsOut { float4 position : SV_POSITION; float4 color : COLOR; };

[shader("vertex")]
VsOut vertexMain(VsIn i) {
    VsOut o;
    o.position = mul(vsParams.proj, mul(vsParams.view, float4(i.position, 1.0)));
    o.color = i.color;
    return o;
}

[shader("fragment")]
float4 fragmentMain(VsOut i) : SV_TARGET {
    return i.color;
}