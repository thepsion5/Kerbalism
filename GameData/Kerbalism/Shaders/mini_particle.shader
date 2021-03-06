// render a 1 pixel point sprite
// - POINT_COLOR: point color


Shader "Custom/MiniParticle"
{
  Properties
  {
    POINT_COLOR ("Point color", Color) = (1.0,1.0,1.0,1.0)
  }
  SubShader
  {
    Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
    Blend SrcAlpha One
    ColorMask RGB
    Cull Off Lighting Off ZWrite Off

    Pass
    {
      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag

      fixed4 POINT_COLOR;

      struct v2f
      {
        float size : PSIZE;
        float4 pos : POSITION;
      };

      v2f vert(float4 in_pos : POSITION)
      {
        // output clip-space vertex position
        v2f o;
        o.pos = mul(UNITY_MATRIX_MVP, in_pos);

        // pass down point size
        o.size = 1.0;
        return o;
      }

      half4 frag(v2f i) : COLOR
      {
        return POINT_COLOR;
      }
      ENDCG
    }
  }
}