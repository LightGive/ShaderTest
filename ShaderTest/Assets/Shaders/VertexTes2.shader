﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/VertexTes1" 
{
	Properties
	{
		_MainTex("Albedo (RGB)", 2D) = "white" {}
		_Color("MainColor" , Color) = (.34, .85, .92, 1)
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque" }

		Pass
		{
			CGPROGRAM
		
			#pragma surface surf Standard fullforwardshadows
			#pragma	target 3.0


			sampler2D _MainTex;

			struct Input 
			{
				float2 uv_MainTex;
			};

			float4 vert(float4 v:POSITION) : SV_POSITION
			{
				v.x += _SinTime.x * v.x * sin(v.y);
				return UnityObjectToClipPos(v);
			}

			half _Glossiness;
			half _Metallic;
			fixed4 _Color;

			void surf(Input IN, inout SurfaceOutputStandard o) 
			{
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
				o.Albedo = c.rgb;
				o.Metallic = _Metallic;
				o.Smoothness = _Glossiness;
				o.Alpha = c.a;
			}

			ENDCG
		}
	}
}