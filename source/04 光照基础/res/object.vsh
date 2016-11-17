#version 330 core
layout (location = 0) in vec3 position;//����
layout (location = 1) in vec3 normal;//������

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 Normal;  //������
out vec3 FragPos; //����λ�ã����ڽ�Ϲ�Դλ�ã�������շ���

void main()
{
    gl_Position = projection * view * model * vec4(position, 1.0f);
	FragPos = vec3(model * vec4(position, 1.0f));//��ǰ�������������
	Normal = mat3(transpose(inverse(model))) * normal;//�ȵõ��������Ȼ������ά�����ٳ��Է��������õ�������������ϵ�ķ�����
}