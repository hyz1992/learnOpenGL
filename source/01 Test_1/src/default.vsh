#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;
layout (location = 2) in vec2 texCoord;
out vec4 outColor;
out vec2 TexCoord;
uniform vec4 uniformColor;
uniform mat4 transform;
void main()
{
	gl_Position = transform * vec4(position, 1.0);
	if (gl_Position.x==-0.5)
		outColor = uniformColor;
	else
		outColor = vec4(1.0f,1.0f,1.0f,1.0f);
	TexCoord = vec2(texCoord.x, 1.0 - texCoord.y);
}