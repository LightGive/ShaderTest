Shader "Example/Transform Vertex" 
{
	Properties{
		_TimeScale("Wave scale", Range(0.0,10.0)) = 1.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque" }

		CGPROGRAM
#pragma surface surf Lambert vertex:vert
	
	struct Input 
	{
		float4 color : COLOR;
	};

	void vert(inout appdata_full v)
	{
		uniform float _TimeScale;
		v.vertex.x += _SinTime.x* _TimeScale* v.normal.x * sin(v.vertex.y);
		//v.vertex.z += _SinTime.x * v.normal.z * sin(v.vertex.y * 3.14 * 16);
	}

	void surf(Input IN, inout SurfaceOutput o) 
	{
		o.Albedo = half3(1, 0.5, 0.5);
	}
	ENDCG
	}
		Fallback "Diffuse"
}