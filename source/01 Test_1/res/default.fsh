#version 330 core
out vec4 color;
in vec4 outColor;
in vec2 TexCoord;
uniform sampler2D ourTexture1;
uniform sampler2D ourTexture2;
uniform float mixValue;
void main()
{
	color = outColor;
	color = outColor*mix(texture(ourTexture1, TexCoord), texture(ourTexture2, TexCoord), mixValue);
	//color = texture(ourTexture1,TexCoord);
};