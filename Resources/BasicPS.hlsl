#include "Basic.hlsli"

Texture2D<float4> tex : register(t0);  	// 0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp : register(s0);      	// 0�ԃX���b�g�ɐݒ肳�ꂽ�T���v���[

float4 main(VSOutput input) : SV_TARGET
{
    float4 texcolor = float4(tex.Sample(smp, input.uv));

    // �E�����@�����̃��C�g
    float3 light = normalize(float3(1,-1,1));
    // �����ւ̃x�N�g���Ɩ@���x�N�g���̓���
    float diffuse = saturate(dot(-light, input.normal));
    // �A���r�G���g����0.3�Ƃ��Čv�Z
    float ambient = 0.3f;
    // ���邳���v�Z
    float brightness = diffuse + ambient;
    // �e�N�X�`���ƃV�F�[�f�B���O�ɂ��F������
    return float4(texcolor.rgb * brightness, texcolor.a) * color;
}