#version 330 core
layout (location = 0) in vec3 position;//顶点
layout (location = 1) in vec3 normal;//法向量

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 Normal;  //法向量
out vec3 FragPos; //顶点位置（用于结合光源位置，计算光照方向）

void main()
{
    gl_Position = projection * view * model * vec4(position, 1.0f);
	FragPos = vec3(model * vec4(position, 1.0f));//当前顶点的世界坐标
	Normal = mat3(transpose(inverse(model))) * normal;//先得到正规矩阵，然后变成三维矩阵，再乘以法向量，得到的是世界坐标系的法向量
}