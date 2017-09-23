﻿/******************************************************************************/
/*
  Project - Unity CJ Lib
            https://github.com/TheAllenChou/unity-cj-lib
  
  Author  - Ming-Lun "Allen" Chou
  Web     - http://AllenChou.net
  Twitter - @TheAllenChou
*/
/******************************************************************************/

Shader "CjLib/RectWireframe"
{
  Properties
  {
    _Color ("Color", Color) = (1.0, 1.0, 1.0, 1.0)
    _Dimensions ("Dimensions", Vector) = (1.0, 1.0, 0.0, 0.0)
    _MainTex ("Texture", 2D) = "white" {}
  }
  SubShader
  {
    Tags { "RenderType"="Opaque" }
    LOD 100

    Pass
    {
      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag
      // make fog work
      #pragma multi_compile_fog

      #include "UnityCG.cginc"

      struct appdata
      {
        float4 vertex : POSITION;
      };

      struct v2f
      {
        UNITY_FOG_COORDS(1)
        float4 vertex : SV_POSITION;
      };

      float4 _Color;
      float4 _Dimensions;

      sampler2D _MainTex;
      float4 _MainTex_ST;

      v2f vert (appdata v)
      {
        v2f o;
        v.vertex.xz *= _Dimensions.xz;
        o.vertex = UnityObjectToClipPos(v.vertex);
        UNITY_TRANSFER_FOG(o,o.vertex);
        return o;
      }

      fixed4 frag (v2f i) : SV_Target
      {
        UNITY_APPLY_FOG(i.fogCoord, _Color);
        return _Color;
      }
      ENDCG
    }
  }
}