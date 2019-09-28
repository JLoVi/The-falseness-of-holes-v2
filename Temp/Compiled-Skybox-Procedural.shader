// Compiled shader for iOS

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Skybox/Procedural" {
Properties {
[KeywordEnum(None, Simple, High Quality)]  _SunDisk ("Sun", Float) = 2.000000
 _SunSize ("Sun Size", Range(0.000000,1.000000)) = 0.040000
 _SunSizeConvergence ("Sun Size Convergence", Range(1.000000,10.000000)) = 5.000000
 _AtmosphereThickness ("Atmosphere Thickness", Range(0.000000,5.000000)) = 1.000000
 _SkyTint ("Sky Tint", Color) = (0.500000,0.500000,0.500000,1.000000)
 _GroundColor ("Ground", Color) = (0.369000,0.349000,0.341000,1.000000)
 _Exposure ("Exposure", Range(0.000000,8.000000)) = 1.300000

 
}
SubShader { 
 Tags { "QUEUE"="Background" "RenderType"="Background" "PreviewType"="Skybox" }
 Pass {
  Tags { "QUEUE"="Background" "RenderType"="Background" "PreviewType"="Skybox" }
  ZWrite Off
  Cull Off
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_NONE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (170 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _Exposure at 144
  VectorHalf3 _GroundColor at 152
  VectorHalf3 _SkyTint at 160
  ScalarHalf _AtmosphereThickness at 168
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    half TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    float u_xlat8;
    float3 u_xlat13;
    float u_xlat16;
    float u_xlat21;
    float u_xlat24;
    float u_xlat25;
    float u_xlat26;
    half u_xlat16_27;
    float u_xlat28;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat2.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat24, u_xlat0.x);
        u_xlat8 = fma((-u_xlat0.y), u_xlat24, 1.0);
        u_xlat16 = fma(u_xlat8, 5.25, -6.80000019);
        u_xlat16 = fma(u_xlat8, u_xlat16, 3.82999992);
        u_xlat16 = fma(u_xlat8, u_xlat16, 0.458999991);
        u_xlat8 = fma(u_xlat8, u_xlat16, -0.00286999997);
        u_xlat8 = u_xlat8 * 1.44269502;
        u_xlat0.y = exp2(u_xlat8);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat24 = sqrt(u_xlat24);
        u_xlat25 = (-u_xlat24) + 1.0;
        u_xlat25 = u_xlat25 * 230.831207;
        u_xlat25 = exp2(u_xlat25);
        u_xlat26 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat26 = u_xlat26 / u_xlat24;
        u_xlat28 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat24 = u_xlat28 / u_xlat24;
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat28 = fma(u_xlat26, 5.25, -6.80000019);
        u_xlat28 = fma(u_xlat26, u_xlat28, 3.82999992);
        u_xlat28 = fma(u_xlat26, u_xlat28, 0.458999991);
        u_xlat26 = fma(u_xlat26, u_xlat28, -0.00286999997);
        u_xlat26 = u_xlat26 * 1.44269502;
        u_xlat26 = exp2(u_xlat26);
        u_xlat24 = (-u_xlat24) + 1.0;
        u_xlat28 = fma(u_xlat24, 5.25, -6.80000019);
        u_xlat28 = fma(u_xlat24, u_xlat28, 3.82999992);
        u_xlat28 = fma(u_xlat24, u_xlat28, 0.458999991);
        u_xlat24 = fma(u_xlat24, u_xlat28, -0.00286999997);
        u_xlat24 = u_xlat24 * 1.44269502;
        u_xlat24 = exp2(u_xlat24);
        u_xlat24 = u_xlat24 * 0.25;
        u_xlat24 = fma(u_xlat26, 0.25, (-u_xlat24));
        u_xlat24 = fma(u_xlat25, u_xlat24, u_xlat0.y);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat24 = min(u_xlat24, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat24)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat24 = u_xlat0.z * u_xlat25;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat25 = (-u_xlat0.x) + 1.0;
        u_xlat25 = u_xlat25 * 230.831207;
        u_xlat25 = exp2(u_xlat25);
        u_xlat26 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat26 = u_xlat26 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat4.x = fma(u_xlat26, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat26, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat26, u_xlat4.x, 0.458999991);
        u_xlat26 = fma(u_xlat26, u_xlat4.x, -0.00286999997);
        u_xlat26 = u_xlat26 * 1.44269502;
        u_xlat26 = exp2(u_xlat26);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat26, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat25, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat25;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat24), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat26 = min(u_xlat2.y, -0.00100000005);
        u_xlat26 = -9.99999975e-05 / u_xlat26;
        u_xlat5.xyz = fma(float3(u_xlat26), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat21 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat21 = fma(u_xlat5.y, u_xlat21, 3.82999992);
        u_xlat21 = fma(u_xlat5.y, u_xlat21, 0.458999991);
        u_xlat13.x = fma(u_xlat5.y, u_xlat21, -0.00286999997);
        u_xlat13.x = u_xlat13.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat13.x);
        u_xlat21 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat21 = fma(u_xlat5.x, u_xlat21, 3.82999992);
        u_xlat21 = fma(u_xlat5.x, u_xlat21, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat21, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat13.xz = float2(u_xlat26) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat13.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat26 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat26 = sqrt(u_xlat26);
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat26 = u_xlat26 * 230.831207;
        u_xlat26 = exp2(u_xlat26);
        u_xlat5.x = fma(u_xlat26, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat26 = u_xlat13.z * u_xlat26;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat26);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    u_xlat26 = u_xlat2.y * -50.0;
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_27 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_27 = fma(u_xlat16_27, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_27) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD0 = half(u_xlat26);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    half TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half u_xlat16_0;
    half3 u_xlat16_1;
    u_xlat16_0 = input.TEXCOORD0;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0h, 1.0h);
    u_xlat16_1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    output.SV_Target0.xyz = fma(half3(u_xlat16_0), u_xlat16_1.xyz, input.TEXCOORD2.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_NONE 
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (170 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _Exposure at 144
  VectorHalf3 _GroundColor at 152
  VectorHalf3 _SkyTint at 160
  ScalarHalf _AtmosphereThickness at 168
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    half TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    float u_xlat8;
    float3 u_xlat13;
    float u_xlat16;
    float u_xlat21;
    float u_xlat24;
    float u_xlat25;
    float u_xlat26;
    half u_xlat16_27;
    float u_xlat28;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat2.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat24, u_xlat0.x);
        u_xlat8 = fma((-u_xlat0.y), u_xlat24, 1.0);
        u_xlat16 = fma(u_xlat8, 5.25, -6.80000019);
        u_xlat16 = fma(u_xlat8, u_xlat16, 3.82999992);
        u_xlat16 = fma(u_xlat8, u_xlat16, 0.458999991);
        u_xlat8 = fma(u_xlat8, u_xlat16, -0.00286999997);
        u_xlat8 = u_xlat8 * 1.44269502;
        u_xlat0.y = exp2(u_xlat8);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat24 = sqrt(u_xlat24);
        u_xlat25 = (-u_xlat24) + 1.0;
        u_xlat25 = u_xlat25 * 230.831207;
        u_xlat25 = exp2(u_xlat25);
        u_xlat26 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat26 = u_xlat26 / u_xlat24;
        u_xlat28 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat24 = u_xlat28 / u_xlat24;
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat28 = fma(u_xlat26, 5.25, -6.80000019);
        u_xlat28 = fma(u_xlat26, u_xlat28, 3.82999992);
        u_xlat28 = fma(u_xlat26, u_xlat28, 0.458999991);
        u_xlat26 = fma(u_xlat26, u_xlat28, -0.00286999997);
        u_xlat26 = u_xlat26 * 1.44269502;
        u_xlat26 = exp2(u_xlat26);
        u_xlat24 = (-u_xlat24) + 1.0;
        u_xlat28 = fma(u_xlat24, 5.25, -6.80000019);
        u_xlat28 = fma(u_xlat24, u_xlat28, 3.82999992);
        u_xlat28 = fma(u_xlat24, u_xlat28, 0.458999991);
        u_xlat24 = fma(u_xlat24, u_xlat28, -0.00286999997);
        u_xlat24 = u_xlat24 * 1.44269502;
        u_xlat24 = exp2(u_xlat24);
        u_xlat24 = u_xlat24 * 0.25;
        u_xlat24 = fma(u_xlat26, 0.25, (-u_xlat24));
        u_xlat24 = fma(u_xlat25, u_xlat24, u_xlat0.y);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat24 = min(u_xlat24, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat24)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat24 = u_xlat0.z * u_xlat25;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat25 = (-u_xlat0.x) + 1.0;
        u_xlat25 = u_xlat25 * 230.831207;
        u_xlat25 = exp2(u_xlat25);
        u_xlat26 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat26 = u_xlat26 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat4.x = fma(u_xlat26, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat26, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat26, u_xlat4.x, 0.458999991);
        u_xlat26 = fma(u_xlat26, u_xlat4.x, -0.00286999997);
        u_xlat26 = u_xlat26 * 1.44269502;
        u_xlat26 = exp2(u_xlat26);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat26, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat25, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat25;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat24), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat26 = min(u_xlat2.y, -0.00100000005);
        u_xlat26 = -9.99999975e-05 / u_xlat26;
        u_xlat5.xyz = fma(float3(u_xlat26), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat21 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat21 = fma(u_xlat5.y, u_xlat21, 3.82999992);
        u_xlat21 = fma(u_xlat5.y, u_xlat21, 0.458999991);
        u_xlat13.x = fma(u_xlat5.y, u_xlat21, -0.00286999997);
        u_xlat13.x = u_xlat13.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat13.x);
        u_xlat21 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat21 = fma(u_xlat5.x, u_xlat21, 3.82999992);
        u_xlat21 = fma(u_xlat5.x, u_xlat21, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat21, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat13.xz = float2(u_xlat26) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat13.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat26 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat26 = sqrt(u_xlat26);
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat26 = u_xlat26 * 230.831207;
        u_xlat26 = exp2(u_xlat26);
        u_xlat5.x = fma(u_xlat26, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat26 = u_xlat13.z * u_xlat26;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat26);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    u_xlat26 = u_xlat2.y * -50.0;
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_27 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_27 = fma(u_xlat16_27, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_27) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD0 = half(u_xlat26);
    return output;
}


-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    half TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half u_xlat16_0;
    half3 u_xlat16_1;
    u_xlat16_0 = input.TEXCOORD0;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0h, 1.0h);
    u_xlat16_1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    output.SV_Target0.xyz = fma(half3(u_xlat16_0), u_xlat16_1.xyz, input.TEXCOORD2.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_NONE 
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (170 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _Exposure at 144
  VectorHalf3 _GroundColor at 152
  VectorHalf3 _SkyTint at 160
  ScalarHalf _AtmosphereThickness at 168
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    half TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    float u_xlat8;
    float3 u_xlat13;
    float u_xlat16;
    float u_xlat21;
    float u_xlat24;
    float u_xlat25;
    float u_xlat26;
    half u_xlat16_27;
    float u_xlat28;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat2.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat24, u_xlat0.x);
        u_xlat8 = fma((-u_xlat0.y), u_xlat24, 1.0);
        u_xlat16 = fma(u_xlat8, 5.25, -6.80000019);
        u_xlat16 = fma(u_xlat8, u_xlat16, 3.82999992);
        u_xlat16 = fma(u_xlat8, u_xlat16, 0.458999991);
        u_xlat8 = fma(u_xlat8, u_xlat16, -0.00286999997);
        u_xlat8 = u_xlat8 * 1.44269502;
        u_xlat0.y = exp2(u_xlat8);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat24 = sqrt(u_xlat24);
        u_xlat25 = (-u_xlat24) + 1.0;
        u_xlat25 = u_xlat25 * 230.831207;
        u_xlat25 = exp2(u_xlat25);
        u_xlat26 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat26 = u_xlat26 / u_xlat24;
        u_xlat28 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat24 = u_xlat28 / u_xlat24;
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat28 = fma(u_xlat26, 5.25, -6.80000019);
        u_xlat28 = fma(u_xlat26, u_xlat28, 3.82999992);
        u_xlat28 = fma(u_xlat26, u_xlat28, 0.458999991);
        u_xlat26 = fma(u_xlat26, u_xlat28, -0.00286999997);
        u_xlat26 = u_xlat26 * 1.44269502;
        u_xlat26 = exp2(u_xlat26);
        u_xlat24 = (-u_xlat24) + 1.0;
        u_xlat28 = fma(u_xlat24, 5.25, -6.80000019);
        u_xlat28 = fma(u_xlat24, u_xlat28, 3.82999992);
        u_xlat28 = fma(u_xlat24, u_xlat28, 0.458999991);
        u_xlat24 = fma(u_xlat24, u_xlat28, -0.00286999997);
        u_xlat24 = u_xlat24 * 1.44269502;
        u_xlat24 = exp2(u_xlat24);
        u_xlat24 = u_xlat24 * 0.25;
        u_xlat24 = fma(u_xlat26, 0.25, (-u_xlat24));
        u_xlat24 = fma(u_xlat25, u_xlat24, u_xlat0.y);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat24 = min(u_xlat24, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat24)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat24 = u_xlat0.z * u_xlat25;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat25 = (-u_xlat0.x) + 1.0;
        u_xlat25 = u_xlat25 * 230.831207;
        u_xlat25 = exp2(u_xlat25);
        u_xlat26 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat26 = u_xlat26 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat4.x = fma(u_xlat26, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat26, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat26, u_xlat4.x, 0.458999991);
        u_xlat26 = fma(u_xlat26, u_xlat4.x, -0.00286999997);
        u_xlat26 = u_xlat26 * 1.44269502;
        u_xlat26 = exp2(u_xlat26);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat26, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat25, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat25;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat24), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat26 = min(u_xlat2.y, -0.00100000005);
        u_xlat26 = -9.99999975e-05 / u_xlat26;
        u_xlat5.xyz = fma(float3(u_xlat26), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat21 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat21 = fma(u_xlat5.y, u_xlat21, 3.82999992);
        u_xlat21 = fma(u_xlat5.y, u_xlat21, 0.458999991);
        u_xlat13.x = fma(u_xlat5.y, u_xlat21, -0.00286999997);
        u_xlat13.x = u_xlat13.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat13.x);
        u_xlat21 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat21 = fma(u_xlat5.x, u_xlat21, 3.82999992);
        u_xlat21 = fma(u_xlat5.x, u_xlat21, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat21, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat13.xz = float2(u_xlat26) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat13.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat26 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat26 = sqrt(u_xlat26);
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat26 = u_xlat26 * 230.831207;
        u_xlat26 = exp2(u_xlat26);
        u_xlat5.x = fma(u_xlat26, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat26 = u_xlat13.z * u_xlat26;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat26);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    u_xlat26 = u_xlat2.y * -50.0;
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_27 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_27 = fma(u_xlat16_27, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_27) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD0 = half(u_xlat26);
    return output;
}


-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    half TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half u_xlat16_0;
    half3 u_xlat16_1;
    u_xlat16_0 = input.TEXCOORD0;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0h, 1.0h);
    u_xlat16_1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    output.SV_Target0.xyz = fma(half3(u_xlat16_0), u_xlat16_1.xyz, input.TEXCOORD2.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_SIMPLE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (178 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 144
  ScalarHalf _Exposure at 152
  VectorHalf3 _GroundColor at 160
  VectorHalf3 _SkyTint at 168
  ScalarHalf _AtmosphereThickness at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half4 _LightColor0;
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    half3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    half3 u_xlat16_8;
    float u_xlat9;
    float3 u_xlat14;
    float u_xlat18;
    float u_xlat23;
    float u_xlat27;
    float u_xlat28;
    float u_xlat29;
    half u_xlat16_30;
    float u_xlat31;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = rsqrt(u_xlat27);
    u_xlat2.xyz = float3(u_xlat27) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat27, u_xlat0.x);
        u_xlat9 = fma((-u_xlat0.y), u_xlat27, 1.0);
        u_xlat18 = fma(u_xlat9, 5.25, -6.80000019);
        u_xlat18 = fma(u_xlat9, u_xlat18, 3.82999992);
        u_xlat18 = fma(u_xlat9, u_xlat18, 0.458999991);
        u_xlat9 = fma(u_xlat9, u_xlat18, -0.00286999997);
        u_xlat9 = u_xlat9 * 1.44269502;
        u_xlat0.y = exp2(u_xlat9);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat27 = sqrt(u_xlat27);
        u_xlat28 = (-u_xlat27) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat27;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat27 = u_xlat31 / u_xlat27;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat31 = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat29, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat29, u_xlat31, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat31, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat27 = (-u_xlat27) + 1.0;
        u_xlat31 = fma(u_xlat27, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat27, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat27, u_xlat31, 0.458999991);
        u_xlat27 = fma(u_xlat27, u_xlat31, -0.00286999997);
        u_xlat27 = u_xlat27 * 1.44269502;
        u_xlat27 = exp2(u_xlat27);
        u_xlat27 = u_xlat27 * 0.25;
        u_xlat27 = fma(u_xlat29, 0.25, (-u_xlat27));
        u_xlat27 = fma(u_xlat28, u_xlat27, u_xlat0.y);
        u_xlat27 = max(u_xlat27, 0.0);
        u_xlat27 = min(u_xlat27, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat27)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat27 = u_xlat0.z * u_xlat28;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat28 = (-u_xlat0.x) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat4.x = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat4.x, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat29, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat28, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat28;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat27), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat29 = min(u_xlat2.y, -0.00100000005);
        u_xlat29 = -9.99999975e-05 / u_xlat29;
        u_xlat5.xyz = fma(float3(u_xlat29), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat23 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 0.458999991);
        u_xlat14.x = fma(u_xlat5.y, u_xlat23, -0.00286999997);
        u_xlat14.x = u_xlat14.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat14.x);
        u_xlat23 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat23, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat14.xz = float2(u_xlat29) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat14.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat29 = u_xlat29 * 230.831207;
        u_xlat29 = exp2(u_xlat29);
        u_xlat5.x = fma(u_xlat29, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat29 = u_xlat14.z * u_xlat29;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat29);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = fma(u_xlat16_30, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_30) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat16_30 = sqrt(u_xlat16_30);
    u_xlat16_30 = max(u_xlat16_30, half(0.25));
    u_xlat16_30 = min(u_xlat16_30, half(1.0));
    u_xlat16_8.xyz = u_xlat16_0.xyz * half3(8000.0, 8000.0, 8000.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0h, 1.0h);
    u_xlat16_8.xyz = u_xlat16_8.xyz * VGlobals._LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * half3(27.0, 27.0, 27.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz / half3(u_xlat16_30);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD3.xyz = sqrt(u_xlat16_8.xyz);
    output.TEXCOORD0.xyz = half3((-u_xlat2.xyz));
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _SunSize at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    half _SunSize;
};

struct Mtl_FragmentIn
{
    half3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half3 u_xlat16_0;
    half3 u_xlat16_1;
    bool u_xlatb2;
    half3 u_xlat16_3;
    u_xlat16_0.xyz = half3(float3(input.TEXCOORD0.xyz) + FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat16_3.x = half(1.0) / FGlobals._SunSize;
    u_xlat16_0.x = u_xlat16_3.x * u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0h, 1.0h);
    u_xlat16_3.x = fma(u_xlat16_0.x, half(-2.0), half(3.0));
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = fma((-u_xlat16_3.x), u_xlat16_0.x, half(1.0));
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = input.TEXCOORD0.y * half(50.0);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlat16_1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat16_3.xyz = fma(u_xlat16_3.xxx, u_xlat16_1.xyz, input.TEXCOORD2.xyz);
    u_xlat16_1.xyz = fma(input.TEXCOORD3.xyz, u_xlat16_0.xxx, u_xlat16_3.xyz);
    u_xlatb2 = input.TEXCOORD0.y<half(0.0);
    output.SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_SIMPLE 
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (178 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 144
  ScalarHalf _Exposure at 152
  VectorHalf3 _GroundColor at 160
  VectorHalf3 _SkyTint at 168
  ScalarHalf _AtmosphereThickness at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half4 _LightColor0;
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    half3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    half3 u_xlat16_8;
    float u_xlat9;
    float3 u_xlat14;
    float u_xlat18;
    float u_xlat23;
    float u_xlat27;
    float u_xlat28;
    float u_xlat29;
    half u_xlat16_30;
    float u_xlat31;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = rsqrt(u_xlat27);
    u_xlat2.xyz = float3(u_xlat27) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat27, u_xlat0.x);
        u_xlat9 = fma((-u_xlat0.y), u_xlat27, 1.0);
        u_xlat18 = fma(u_xlat9, 5.25, -6.80000019);
        u_xlat18 = fma(u_xlat9, u_xlat18, 3.82999992);
        u_xlat18 = fma(u_xlat9, u_xlat18, 0.458999991);
        u_xlat9 = fma(u_xlat9, u_xlat18, -0.00286999997);
        u_xlat9 = u_xlat9 * 1.44269502;
        u_xlat0.y = exp2(u_xlat9);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat27 = sqrt(u_xlat27);
        u_xlat28 = (-u_xlat27) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat27;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat27 = u_xlat31 / u_xlat27;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat31 = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat29, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat29, u_xlat31, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat31, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat27 = (-u_xlat27) + 1.0;
        u_xlat31 = fma(u_xlat27, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat27, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat27, u_xlat31, 0.458999991);
        u_xlat27 = fma(u_xlat27, u_xlat31, -0.00286999997);
        u_xlat27 = u_xlat27 * 1.44269502;
        u_xlat27 = exp2(u_xlat27);
        u_xlat27 = u_xlat27 * 0.25;
        u_xlat27 = fma(u_xlat29, 0.25, (-u_xlat27));
        u_xlat27 = fma(u_xlat28, u_xlat27, u_xlat0.y);
        u_xlat27 = max(u_xlat27, 0.0);
        u_xlat27 = min(u_xlat27, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat27)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat27 = u_xlat0.z * u_xlat28;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat28 = (-u_xlat0.x) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat4.x = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat4.x, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat29, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat28, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat28;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat27), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat29 = min(u_xlat2.y, -0.00100000005);
        u_xlat29 = -9.99999975e-05 / u_xlat29;
        u_xlat5.xyz = fma(float3(u_xlat29), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat23 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 0.458999991);
        u_xlat14.x = fma(u_xlat5.y, u_xlat23, -0.00286999997);
        u_xlat14.x = u_xlat14.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat14.x);
        u_xlat23 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat23, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat14.xz = float2(u_xlat29) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat14.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat29 = u_xlat29 * 230.831207;
        u_xlat29 = exp2(u_xlat29);
        u_xlat5.x = fma(u_xlat29, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat29 = u_xlat14.z * u_xlat29;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat29);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = fma(u_xlat16_30, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_30) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat16_30 = sqrt(u_xlat16_30);
    u_xlat16_30 = max(u_xlat16_30, half(0.25));
    u_xlat16_30 = min(u_xlat16_30, half(1.0));
    u_xlat16_8.xyz = u_xlat16_0.xyz * half3(8000.0, 8000.0, 8000.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0h, 1.0h);
    u_xlat16_8.xyz = u_xlat16_8.xyz * VGlobals._LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * half3(27.0, 27.0, 27.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz / half3(u_xlat16_30);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD3.xyz = sqrt(u_xlat16_8.xyz);
    output.TEXCOORD0.xyz = half3((-u_xlat2.xyz));
    return output;
}


-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _SunSize at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    half _SunSize;
};

struct Mtl_FragmentIn
{
    half3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half3 u_xlat16_0;
    half3 u_xlat16_1;
    bool u_xlatb2;
    half3 u_xlat16_3;
    u_xlat16_0.xyz = half3(float3(input.TEXCOORD0.xyz) + FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat16_3.x = half(1.0) / FGlobals._SunSize;
    u_xlat16_0.x = u_xlat16_3.x * u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0h, 1.0h);
    u_xlat16_3.x = fma(u_xlat16_0.x, half(-2.0), half(3.0));
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = fma((-u_xlat16_3.x), u_xlat16_0.x, half(1.0));
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = input.TEXCOORD0.y * half(50.0);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlat16_1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat16_3.xyz = fma(u_xlat16_3.xxx, u_xlat16_1.xyz, input.TEXCOORD2.xyz);
    u_xlat16_1.xyz = fma(input.TEXCOORD3.xyz, u_xlat16_0.xxx, u_xlat16_3.xyz);
    u_xlatb2 = input.TEXCOORD0.y<half(0.0);
    output.SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_SIMPLE 
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (178 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 144
  ScalarHalf _Exposure at 152
  VectorHalf3 _GroundColor at 160
  VectorHalf3 _SkyTint at 168
  ScalarHalf _AtmosphereThickness at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half4 _LightColor0;
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    half3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    half3 u_xlat16_8;
    float u_xlat9;
    float3 u_xlat14;
    float u_xlat18;
    float u_xlat23;
    float u_xlat27;
    float u_xlat28;
    float u_xlat29;
    half u_xlat16_30;
    float u_xlat31;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = rsqrt(u_xlat27);
    u_xlat2.xyz = float3(u_xlat27) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat27, u_xlat0.x);
        u_xlat9 = fma((-u_xlat0.y), u_xlat27, 1.0);
        u_xlat18 = fma(u_xlat9, 5.25, -6.80000019);
        u_xlat18 = fma(u_xlat9, u_xlat18, 3.82999992);
        u_xlat18 = fma(u_xlat9, u_xlat18, 0.458999991);
        u_xlat9 = fma(u_xlat9, u_xlat18, -0.00286999997);
        u_xlat9 = u_xlat9 * 1.44269502;
        u_xlat0.y = exp2(u_xlat9);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat27 = sqrt(u_xlat27);
        u_xlat28 = (-u_xlat27) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat27;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat27 = u_xlat31 / u_xlat27;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat31 = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat29, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat29, u_xlat31, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat31, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat27 = (-u_xlat27) + 1.0;
        u_xlat31 = fma(u_xlat27, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat27, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat27, u_xlat31, 0.458999991);
        u_xlat27 = fma(u_xlat27, u_xlat31, -0.00286999997);
        u_xlat27 = u_xlat27 * 1.44269502;
        u_xlat27 = exp2(u_xlat27);
        u_xlat27 = u_xlat27 * 0.25;
        u_xlat27 = fma(u_xlat29, 0.25, (-u_xlat27));
        u_xlat27 = fma(u_xlat28, u_xlat27, u_xlat0.y);
        u_xlat27 = max(u_xlat27, 0.0);
        u_xlat27 = min(u_xlat27, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat27)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat27 = u_xlat0.z * u_xlat28;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat28 = (-u_xlat0.x) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat4.x = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat4.x, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat29, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat28, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat28;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat27), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat29 = min(u_xlat2.y, -0.00100000005);
        u_xlat29 = -9.99999975e-05 / u_xlat29;
        u_xlat5.xyz = fma(float3(u_xlat29), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat23 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 0.458999991);
        u_xlat14.x = fma(u_xlat5.y, u_xlat23, -0.00286999997);
        u_xlat14.x = u_xlat14.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat14.x);
        u_xlat23 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat23, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat14.xz = float2(u_xlat29) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat14.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat29 = u_xlat29 * 230.831207;
        u_xlat29 = exp2(u_xlat29);
        u_xlat5.x = fma(u_xlat29, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat29 = u_xlat14.z * u_xlat29;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat29);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = fma(u_xlat16_30, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_30) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat16_30 = sqrt(u_xlat16_30);
    u_xlat16_30 = max(u_xlat16_30, half(0.25));
    u_xlat16_30 = min(u_xlat16_30, half(1.0));
    u_xlat16_8.xyz = u_xlat16_0.xyz * half3(8000.0, 8000.0, 8000.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0h, 1.0h);
    u_xlat16_8.xyz = u_xlat16_8.xyz * VGlobals._LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * half3(27.0, 27.0, 27.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz / half3(u_xlat16_30);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD3.xyz = sqrt(u_xlat16_8.xyz);
    output.TEXCOORD0.xyz = half3((-u_xlat2.xyz));
    return output;
}


-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _SunSize at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    half _SunSize;
};

struct Mtl_FragmentIn
{
    half3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half3 u_xlat16_0;
    half3 u_xlat16_1;
    bool u_xlatb2;
    half3 u_xlat16_3;
    u_xlat16_0.xyz = half3(float3(input.TEXCOORD0.xyz) + FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat16_3.x = half(1.0) / FGlobals._SunSize;
    u_xlat16_0.x = u_xlat16_3.x * u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0h, 1.0h);
    u_xlat16_3.x = fma(u_xlat16_0.x, half(-2.0), half(3.0));
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = fma((-u_xlat16_3.x), u_xlat16_0.x, half(1.0));
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = input.TEXCOORD0.y * half(50.0);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlat16_1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat16_3.xyz = fma(u_xlat16_3.xxx, u_xlat16_1.xyz, input.TEXCOORD2.xyz);
    u_xlat16_1.xyz = fma(input.TEXCOORD3.xyz, u_xlat16_0.xxx, u_xlat16_3.xyz);
    u_xlatb2 = input.TEXCOORD0.y<half(0.0);
    output.SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_HIGH_QUALITY 
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (178 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 144
  ScalarHalf _Exposure at 152
  VectorHalf3 _GroundColor at 160
  VectorHalf3 _SkyTint at 168
  ScalarHalf _AtmosphereThickness at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half4 _LightColor0;
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    half3 u_xlat16_8;
    float u_xlat9;
    float3 u_xlat14;
    float u_xlat18;
    float u_xlat23;
    float u_xlat27;
    float u_xlat28;
    float u_xlat29;
    half u_xlat16_30;
    float u_xlat31;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = rsqrt(u_xlat27);
    u_xlat2.xyz = float3(u_xlat27) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat27, u_xlat0.x);
        u_xlat9 = fma((-u_xlat0.y), u_xlat27, 1.0);
        u_xlat18 = fma(u_xlat9, 5.25, -6.80000019);
        u_xlat18 = fma(u_xlat9, u_xlat18, 3.82999992);
        u_xlat18 = fma(u_xlat9, u_xlat18, 0.458999991);
        u_xlat9 = fma(u_xlat9, u_xlat18, -0.00286999997);
        u_xlat9 = u_xlat9 * 1.44269502;
        u_xlat0.y = exp2(u_xlat9);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat27 = sqrt(u_xlat27);
        u_xlat28 = (-u_xlat27) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat27;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat27 = u_xlat31 / u_xlat27;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat31 = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat29, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat29, u_xlat31, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat31, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat27 = (-u_xlat27) + 1.0;
        u_xlat31 = fma(u_xlat27, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat27, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat27, u_xlat31, 0.458999991);
        u_xlat27 = fma(u_xlat27, u_xlat31, -0.00286999997);
        u_xlat27 = u_xlat27 * 1.44269502;
        u_xlat27 = exp2(u_xlat27);
        u_xlat27 = u_xlat27 * 0.25;
        u_xlat27 = fma(u_xlat29, 0.25, (-u_xlat27));
        u_xlat27 = fma(u_xlat28, u_xlat27, u_xlat0.y);
        u_xlat27 = max(u_xlat27, 0.0);
        u_xlat27 = min(u_xlat27, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat27)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat27 = u_xlat0.z * u_xlat28;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat28 = (-u_xlat0.x) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat4.x = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat4.x, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat29, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat28, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat28;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat27), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat29 = min(u_xlat2.y, -0.00100000005);
        u_xlat29 = -9.99999975e-05 / u_xlat29;
        u_xlat5.xyz = fma(float3(u_xlat29), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat23 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 0.458999991);
        u_xlat14.x = fma(u_xlat5.y, u_xlat23, -0.00286999997);
        u_xlat14.x = u_xlat14.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat14.x);
        u_xlat23 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat23, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat14.xz = float2(u_xlat29) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat14.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat29 = u_xlat29 * 230.831207;
        u_xlat29 = exp2(u_xlat29);
        u_xlat5.x = fma(u_xlat29, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat29 = u_xlat14.z * u_xlat29;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat29);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    output.TEXCOORD0.xyz = (-input.POSITION0.xyz);
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = fma(u_xlat16_30, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_30) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat16_30 = sqrt(u_xlat16_30);
    u_xlat16_30 = max(u_xlat16_30, half(0.25));
    u_xlat16_30 = min(u_xlat16_30, half(1.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0h, 1.0h);
    u_xlat16_8.xyz = u_xlat16_0.xyz * VGlobals._LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * half3(15.0, 15.0, 15.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz / half3(u_xlat16_30);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD3.xyz = sqrt(u_xlat16_8.xyz);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (84 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _SunSize at 80
  ScalarHalf _SunSizeConvergence at 82
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    half _SunSize;
    half _SunSizeConvergence;
};

struct Mtl_FragmentIn
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half2 u_xlat16_0;
    float3 u_xlat1;
    bool u_xlatb1;
    half3 u_xlat16_2;
    half3 u_xlat16_3;
    half u_xlat16_6;
    float u_xlat10;
    u_xlat16_0.x = log2(FGlobals._SunSize);
    u_xlat16_0.x = u_xlat16_0.x * half(0.649999976);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.xyz = input.TEXCOORD0.yyy * FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TEXCOORD0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TEXCOORD0.zzz, u_xlat1.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    u_xlat1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat16_3.x = dot(FGlobals._WorldSpaceLightPos0.xyz, (-u_xlat1.xyz));
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * FGlobals._SunSizeConvergence;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_6 = fma((-u_xlat16_3.x), half(1.98000002), half(1.98010004));
    u_xlat16_0.y = fma(u_xlat16_3.x, u_xlat16_3.x, half(1.0));
    u_xlat16_0.xy = u_xlat16_0.xy * half2(10.0, 0.0100164423);
    u_xlat16_6 = log2(u_xlat16_6);
    u_xlat16_0.x = u_xlat16_6 * u_xlat16_0.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, half(9.99999975e-05));
    u_xlat16_0.x = u_xlat16_0.y / u_xlat16_0.x;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * half(0.454544991);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.x = half(u_xlat1.y * 50.0);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlatb1 = u_xlat1.y<0.0;
    u_xlat16_2.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat16_3.xyz = fma(u_xlat16_3.xxx, u_xlat16_2.xyz, input.TEXCOORD2.xyz);
    u_xlat16_2.xyz = fma(input.TEXCOORD3.xyz, u_xlat16_0.xxx, u_xlat16_3.xyz);
    output.SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_HIGH_QUALITY 
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (178 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 144
  ScalarHalf _Exposure at 152
  VectorHalf3 _GroundColor at 160
  VectorHalf3 _SkyTint at 168
  ScalarHalf _AtmosphereThickness at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half4 _LightColor0;
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    half3 u_xlat16_8;
    float u_xlat9;
    float3 u_xlat14;
    float u_xlat18;
    float u_xlat23;
    float u_xlat27;
    float u_xlat28;
    float u_xlat29;
    half u_xlat16_30;
    float u_xlat31;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = rsqrt(u_xlat27);
    u_xlat2.xyz = float3(u_xlat27) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat27, u_xlat0.x);
        u_xlat9 = fma((-u_xlat0.y), u_xlat27, 1.0);
        u_xlat18 = fma(u_xlat9, 5.25, -6.80000019);
        u_xlat18 = fma(u_xlat9, u_xlat18, 3.82999992);
        u_xlat18 = fma(u_xlat9, u_xlat18, 0.458999991);
        u_xlat9 = fma(u_xlat9, u_xlat18, -0.00286999997);
        u_xlat9 = u_xlat9 * 1.44269502;
        u_xlat0.y = exp2(u_xlat9);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat27 = sqrt(u_xlat27);
        u_xlat28 = (-u_xlat27) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat27;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat27 = u_xlat31 / u_xlat27;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat31 = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat29, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat29, u_xlat31, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat31, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat27 = (-u_xlat27) + 1.0;
        u_xlat31 = fma(u_xlat27, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat27, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat27, u_xlat31, 0.458999991);
        u_xlat27 = fma(u_xlat27, u_xlat31, -0.00286999997);
        u_xlat27 = u_xlat27 * 1.44269502;
        u_xlat27 = exp2(u_xlat27);
        u_xlat27 = u_xlat27 * 0.25;
        u_xlat27 = fma(u_xlat29, 0.25, (-u_xlat27));
        u_xlat27 = fma(u_xlat28, u_xlat27, u_xlat0.y);
        u_xlat27 = max(u_xlat27, 0.0);
        u_xlat27 = min(u_xlat27, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat27)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat27 = u_xlat0.z * u_xlat28;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat28 = (-u_xlat0.x) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat4.x = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat4.x, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat29, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat28, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat28;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat27), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat29 = min(u_xlat2.y, -0.00100000005);
        u_xlat29 = -9.99999975e-05 / u_xlat29;
        u_xlat5.xyz = fma(float3(u_xlat29), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat23 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 0.458999991);
        u_xlat14.x = fma(u_xlat5.y, u_xlat23, -0.00286999997);
        u_xlat14.x = u_xlat14.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat14.x);
        u_xlat23 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat23, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat14.xz = float2(u_xlat29) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat14.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat29 = u_xlat29 * 230.831207;
        u_xlat29 = exp2(u_xlat29);
        u_xlat5.x = fma(u_xlat29, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat29 = u_xlat14.z * u_xlat29;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat29);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    output.TEXCOORD0.xyz = (-input.POSITION0.xyz);
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = fma(u_xlat16_30, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_30) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat16_30 = sqrt(u_xlat16_30);
    u_xlat16_30 = max(u_xlat16_30, half(0.25));
    u_xlat16_30 = min(u_xlat16_30, half(1.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0h, 1.0h);
    u_xlat16_8.xyz = u_xlat16_0.xyz * VGlobals._LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * half3(15.0, 15.0, 15.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz / half3(u_xlat16_30);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD3.xyz = sqrt(u_xlat16_8.xyz);
    return output;
}


-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (84 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _SunSize at 80
  ScalarHalf _SunSizeConvergence at 82
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    half _SunSize;
    half _SunSizeConvergence;
};

struct Mtl_FragmentIn
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half2 u_xlat16_0;
    float3 u_xlat1;
    bool u_xlatb1;
    half3 u_xlat16_2;
    half3 u_xlat16_3;
    half u_xlat16_6;
    float u_xlat10;
    u_xlat16_0.x = log2(FGlobals._SunSize);
    u_xlat16_0.x = u_xlat16_0.x * half(0.649999976);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.xyz = input.TEXCOORD0.yyy * FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TEXCOORD0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TEXCOORD0.zzz, u_xlat1.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    u_xlat1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat16_3.x = dot(FGlobals._WorldSpaceLightPos0.xyz, (-u_xlat1.xyz));
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * FGlobals._SunSizeConvergence;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_6 = fma((-u_xlat16_3.x), half(1.98000002), half(1.98010004));
    u_xlat16_0.y = fma(u_xlat16_3.x, u_xlat16_3.x, half(1.0));
    u_xlat16_0.xy = u_xlat16_0.xy * half2(10.0, 0.0100164423);
    u_xlat16_6 = log2(u_xlat16_6);
    u_xlat16_0.x = u_xlat16_6 * u_xlat16_0.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, half(9.99999975e-05));
    u_xlat16_0.x = u_xlat16_0.y / u_xlat16_0.x;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * half(0.454544991);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.x = half(u_xlat1.y * 50.0);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlatb1 = u_xlat1.y<0.0;
    u_xlat16_2.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat16_3.xyz = fma(u_xlat16_3.xxx, u_xlat16_2.xyz, input.TEXCOORD2.xyz);
    u_xlat16_2.xyz = fma(input.TEXCOORD3.xyz, u_xlat16_0.xxx, u_xlat16_3.xyz);
    output.SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: _SUNDISK_HIGH_QUALITY 
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (178 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 144
  ScalarHalf _Exposure at 152
  VectorHalf3 _GroundColor at 160
  VectorHalf3 _SkyTint at 168
  ScalarHalf _AtmosphereThickness at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    half4 _LightColor0;
    half _Exposure;
    half3 _GroundColor;
    half3 _SkyTint;
    half _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half3 u_xlat16_0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    half3 u_xlat16_3;
    float3 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    float3 u_xlat6;
    half3 u_xlat16_7;
    half3 u_xlat16_8;
    float u_xlat9;
    float3 u_xlat14;
    float u_xlat18;
    float u_xlat23;
    float u_xlat27;
    float u_xlat28;
    float u_xlat29;
    half u_xlat16_30;
    float u_xlat31;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-float3(VGlobals._SkyTint.xyzx.xyz)) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat16_3.x = log2(VGlobals._AtmosphereThickness);
    u_xlat16_3.x = u_xlat16_3.x * half(2.5);
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xy = u_xlat16_3.xx * half2(0.049999997, 0.0314159282);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = rsqrt(u_xlat27);
    u_xlat2.xyz = float3(u_xlat27) * u_xlat0.xyz;
    u_xlatb0 = u_xlat2.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat2.y, u_xlat2.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat27, u_xlat0.x);
        u_xlat9 = fma((-u_xlat0.y), u_xlat27, 1.0);
        u_xlat18 = fma(u_xlat9, 5.25, -6.80000019);
        u_xlat18 = fma(u_xlat9, u_xlat18, 3.82999992);
        u_xlat18 = fma(u_xlat9, u_xlat18, 0.458999991);
        u_xlat9 = fma(u_xlat9, u_xlat18, -0.00286999997);
        u_xlat9 = u_xlat9 * 1.44269502;
        u_xlat0.y = exp2(u_xlat9);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat2.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat27 = sqrt(u_xlat27);
        u_xlat28 = (-u_xlat27) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat27;
        u_xlat31 = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat27 = u_xlat31 / u_xlat27;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat31 = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat29, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat29, u_xlat31, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat31, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat27 = (-u_xlat27) + 1.0;
        u_xlat31 = fma(u_xlat27, 5.25, -6.80000019);
        u_xlat31 = fma(u_xlat27, u_xlat31, 3.82999992);
        u_xlat31 = fma(u_xlat27, u_xlat31, 0.458999991);
        u_xlat27 = fma(u_xlat27, u_xlat31, -0.00286999997);
        u_xlat27 = u_xlat27 * 1.44269502;
        u_xlat27 = exp2(u_xlat27);
        u_xlat27 = u_xlat27 * 0.25;
        u_xlat27 = fma(u_xlat29, 0.25, (-u_xlat27));
        u_xlat27 = fma(u_xlat28, u_xlat27, u_xlat0.y);
        u_xlat27 = max(u_xlat27, 0.0);
        u_xlat27 = min(u_xlat27, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat27)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat27 = u_xlat0.z * u_xlat28;
        u_xlat4.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat28 = (-u_xlat0.x) + 1.0;
        u_xlat28 = u_xlat28 * 230.831207;
        u_xlat28 = exp2(u_xlat28);
        u_xlat29 = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat29 = u_xlat29 / u_xlat0.x;
        u_xlat4.x = dot(u_xlat2.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat4.x / u_xlat0.x;
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat4.x = fma(u_xlat29, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat29, u_xlat4.x, 0.458999991);
        u_xlat29 = fma(u_xlat29, u_xlat4.x, -0.00286999997);
        u_xlat29 = u_xlat29 * 1.44269502;
        u_xlat29 = exp2(u_xlat29);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat4.x = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 3.82999992);
        u_xlat4.x = fma(u_xlat0.x, u_xlat4.x, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat4.x, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat29, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat28, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat28;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat27), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    } else {
        u_xlat29 = min(u_xlat2.y, -0.00100000005);
        u_xlat29 = -9.99999975e-05 / u_xlat29;
        u_xlat5.xyz = fma(float3(u_xlat29), u_xlat2.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat5.w = dot((-u_xlat2.xyz), u_xlat5.xyz);
        u_xlat5.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat5.xy = (-u_xlat5.xw) + float2(1.0, 1.0);
        u_xlat23 = fma(u_xlat5.y, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.y, u_xlat23, 0.458999991);
        u_xlat14.x = fma(u_xlat5.y, u_xlat23, -0.00286999997);
        u_xlat14.x = u_xlat14.x * 1.44269502;
        u_xlat5.y = exp2(u_xlat14.x);
        u_xlat23 = fma(u_xlat5.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat5.x, u_xlat23, 0.458999991);
        u_xlat5.x = fma(u_xlat5.x, u_xlat23, -0.00286999997);
        u_xlat5.xyz = u_xlat5.xyy * float3(1.44269502, 0.25, 0.249900013);
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat5.x = fma(u_xlat5.x, 0.25, u_xlat5.y);
        u_xlat14.xz = float2(u_xlat29) * float2(0.5, 20.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat14.xxx;
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = (-u_xlat29) + 1.0;
        u_xlat29 = u_xlat29 * 230.831207;
        u_xlat29 = exp2(u_xlat29);
        u_xlat5.x = fma(u_xlat29, u_xlat5.x, (-u_xlat5.z));
        u_xlat5.x = max(u_xlat5.x, 0.0);
        u_xlat5.x = min(u_xlat5.x, 50.0);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.yyy), float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-u_xlat5.xxx) * u_xlat6.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat29 = u_xlat14.z * u_xlat29;
        u_xlat5.xyz = u_xlat0.xyz * float3(u_xlat29);
        u_xlat6.xyz = fma(u_xlat1.xyz, float3(u_xlat16_3.xxx), float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat5.xyz * u_xlat6.xyz;
        u_xlat16_4.xyz = half3(u_xlat4.xyz);
        u_xlat16_0.xyz = half3(u_xlat0.xyz);
    }
    output.TEXCOORD0.xyz = (-input.POSITION0.xyz);
    u_xlat16_3.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat16_3.xyz = fma(u_xlat16_3.xyz, u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = fma(u_xlat16_30, half(0.75), half(0.75));
    u_xlat16_7.xyz = half3(u_xlat16_30) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * half3(VGlobals._Exposure);
    u_xlat16_30 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat16_30 = sqrt(u_xlat16_30);
    u_xlat16_30 = max(u_xlat16_30, half(0.25));
    u_xlat16_30 = min(u_xlat16_30, half(1.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0h, 1.0h);
    u_xlat16_8.xyz = u_xlat16_0.xyz * VGlobals._LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * half3(15.0, 15.0, 15.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz / half3(u_xlat16_30);
    output.TEXCOORD1.xyz = sqrt(u_xlat16_3.xyz);
    output.TEXCOORD2.xyz = sqrt(u_xlat16_7.xyz);
    output.TEXCOORD3.xyz = sqrt(u_xlat16_8.xyz);
    return output;
}


-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (84 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _WorldSpaceLightPos0 at 0
  ScalarHalf _SunSize at 80
  ScalarHalf _SunSizeConvergence at 82
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    half _SunSize;
    half _SunSizeConvergence;
};

struct Mtl_FragmentIn
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    half3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    half3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    half2 u_xlat16_0;
    float3 u_xlat1;
    bool u_xlatb1;
    half3 u_xlat16_2;
    half3 u_xlat16_3;
    half u_xlat16_6;
    float u_xlat10;
    u_xlat16_0.x = log2(FGlobals._SunSize);
    u_xlat16_0.x = u_xlat16_0.x * half(0.649999976);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.xyz = input.TEXCOORD0.yyy * FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TEXCOORD0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TEXCOORD0.zzz, u_xlat1.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    u_xlat1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat16_3.x = dot(FGlobals._WorldSpaceLightPos0.xyz, (-u_xlat1.xyz));
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * FGlobals._SunSizeConvergence;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_6 = fma((-u_xlat16_3.x), half(1.98000002), half(1.98010004));
    u_xlat16_0.y = fma(u_xlat16_3.x, u_xlat16_3.x, half(1.0));
    u_xlat16_0.xy = u_xlat16_0.xy * half2(10.0, 0.0100164423);
    u_xlat16_6 = log2(u_xlat16_6);
    u_xlat16_0.x = u_xlat16_6 * u_xlat16_0.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = max(u_xlat16_0.x, half(9.99999975e-05));
    u_xlat16_0.x = u_xlat16_0.y / u_xlat16_0.x;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * half(0.454544991);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.x = half(u_xlat1.y * 50.0);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
    u_xlatb1 = u_xlat1.y<0.0;
    u_xlat16_2.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat16_3.xyz = fma(u_xlat16_3.xxx, u_xlat16_2.xyz, input.TEXCOORD2.xyz);
    u_xlat16_2.xyz = fma(input.TEXCOORD3.xyz, u_xlat16_0.xxx, u_xlat16_3.xyz);
    output.SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    output.SV_Target0.w = half(1.0);
    return output;
}


 }
}
CustomEditor "SkyboxProceduralShaderGUI"
Fallback Off
}