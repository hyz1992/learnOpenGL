#version 330 core
out vec4 color;

uniform vec3 objectColor; //������ɫ
uniform vec3 lightColor; //��Դ��ɫ
uniform vec3 lightPos; //��Դ��λ��
uniform vec3 viewPos; //�����λ��

in vec3 Normal;
in vec3 FragPos;

void main()
{
	//��������
    float ambientStrength = 0.1f; //�������ճ���
    vec3 ambient = ambientStrength * lightColor;//������������

	//���������
	vec3 norm = normalize(Normal); //��׼��������
	vec3 lightDir = normalize(lightPos - FragPos);//��׼�����շ�������

	float diff = max(dot(norm, lightDir), 0.0); //����90�ȵģ��ӱ����չ�������Ϊ0
	vec3 diffuse = diff * lightColor; //ɢ������

	//���淴�����
	float specularStrength = 0.5f;//����ǿ��
	vec3 viewDir = normalize(viewPos - FragPos); //�۲췽��
	vec3 reflectDir = reflect(-lightDir, norm); //�����ķ���
	float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32); //32�η������32�Ǹ߹�ķ���ֵ(Shininess)��һ������ķ���ֵԽ�ߣ�����������Խǿ��ɢ���Խ�٣��߹��ԽС
	vec3 specular = specularStrength * spec * lightColor;

	vec3 result = (ambient + diffuse + specular) * objectColor;
    color = vec4(result, 1.0f);
}