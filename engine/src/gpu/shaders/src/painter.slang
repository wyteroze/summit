// Copyright 2026 wyteroze. Licensed under the Apache-2.0 license.

cbuffer vsParams : register(b0) {
    float4x4 ortho;
    float2 origin;
    float2 size;
    float scale;
    uint clipEnabled;
    uint antialiased;
    uint _pad;
};

struct VSInput {
    float2 pos : ATTRIB0;
    float2 uv : ATTRIB1; 
    float4 color : ATTRIB2;
};

struct VaryingsOut {
    float4 pos : SV_POSITION;
    float4 color : COLOR0;
    float2 uv : TEXCOORD0;
    float2 localPos : TEXCOORD1;
};

[shader("vertex")]
void vertexMain(in VSInput vsIn, out VaryingsOut vsOut) {
    float2 local = vsIn.pos * scale;
    vsOut.pos = mul(ortho, float4(origin + local, .0, 1.0));
    vsOut.color = vsIn.color;
    vsOut.uv = vsIn.uv;
    vsOut.localPos = local;
}

[shader("fragment")]
float4 fragmentMain(in VaryingsOut psIn) : SV_TARGET {
    float aa = max(fwidth(psIn.uv.y), .0001);

    if (clipEnabled != 0) {
        if (any(psIn.localPos < 0.0) || any(psIn.localPos > size)) discard;
    }

    float halfWidth = psIn.uv.x;
    float d = abs(psIn.uv.y);

    float alpha;
    if (antialiased != 0) {
        alpha = saturate((halfWidth - d) / aa + .5);
    } else {
        alpha = d <= halfWidth ? 1.0 : 0.0;
    }

    return float4(psIn.color.rgb, psIn.color.a * alpha);
}