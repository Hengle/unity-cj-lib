﻿/******************************************************************************/
/*
  Project - Unity CJ Lib
  https://github.com/TheAllenChou/unity-cj-lib

  Author  - Ming-Lun "Allen" Chou
  Web     - http://AllenChou.net
  Twitter - @TheAllenChou
*/
/******************************************************************************/

Shader "CjLib/PrimitiveFlatColorNoZTest"
{
  SubShader
  {
    Tags { "Queue"="Transparent" "RenderType"="Transparent" "DisableBatching"="true" }
    LOD 100

    Pass
    {
      Blend SrcAlpha OneMinusSrcAlpha
      ZWrite Off ZTest Always

      CGPROGRAM
      #pragma shader_feature NORMAL_ON
      #pragma vertex vert
      #pragma fragment frag
      #include "PrimitiveFlatColorCore.cginc"
      ENDCG
    }
  }
}
