// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Custom/Floor ASE"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_Concrete("Concrete", 2D) = "white" {}
		_Metalness("Metalness", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Albedocolor("Albedo color", Color) = (0.703,0.703,0.703,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Albedocolor;
		uniform sampler2D _Concrete;
		uniform float4 _Concrete_ST;
		uniform float _Metalness;
		uniform float _Smoothness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Concrete = i.uv_texcoord * _Concrete_ST.xy + _Concrete_ST.zw;
			o.Albedo = ( _Albedocolor * tex2D( _Concrete,uv_Concrete) ).xyz;
			o.Metallic = _Metalness;
			float temp_output_4_0 = _Smoothness;
			o.Smoothness = temp_output_4_0;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=6001
2567;29;1666;974;1172.2;377.5001;1.3;True;True
Node;AmplifyShaderEditor.SamplerNode;1;-488,-25;Float;True;Property;_Concrete;Concrete;0;0;Assets/Underground parking/Textures/Concrete.tga;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.ColorNode;9;-457,-226;Float;False;Property;_Albedocolor;Albedo color;3;0;0.703,0.703,0.703,0;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;13;-429,624;Float;False;Constant;_Float0;Float 0;4;0;1;0;0;FLOAT
Node;AmplifyShaderEditor.SamplerNode;10;-552,406;Float;True;Property;_Grunge09jpg;Grunge 09.jpg;3;0;Assets/Underground parking/Textures/Grunge 09.jpg.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;12;-219,488;Float;False;0;FLOAT4;0.0;False;1;FLOAT;0,0,0,0;False;FLOAT4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-134,-16;Float;False;0;COLOR;0.0;False;1;FLOAT4;0.0,0,0,0;False;FLOAT4
Node;AmplifyShaderEditor.RangedFloatNode;3;-507,189;Float;False;Property;_Metalness;Metalness;1;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;4;-511,270;Float;False;Property;_Smoothness;Smoothness;2;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-66,364;Float;False;0;FLOAT;0.0,0,0,0;False;1;FLOAT4;0.0;False;FLOAT4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;113,6;Float;False;True;2;Float;ASEMaterialInspector;Standard;Custom/Floor ASE;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;13;OBJECT;0.0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False
WireConnection;12;0;10;0
WireConnection;12;1;13;0
WireConnection;8;0;9;0
WireConnection;8;1;1;0
WireConnection;11;0;4;0
WireConnection;11;1;12;0
WireConnection;0;0;8;0
WireConnection;0;3;3;0
WireConnection;0;4;4;0
ASEEND*/
//CHKSM=4ABED92D6385D937A58223B6AC1F2F9340FCAC94