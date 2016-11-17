#version 330 core
out vec4 color;

uniform vec3 objectColor; //物体颜色
uniform vec3 lightColor; //光源颜色
uniform vec3 lightPos; //光源的位置
uniform vec3 viewPos; //摄像机位置

in vec3 Normal;
in vec3 FragPos;

void main()
{
	//环境光照
    float ambientStrength = 0.1f; //环境光照常量
    vec3 ambient = ambientStrength * lightColor;//环境光照因子

	//漫反射光照
	vec3 norm = normalize(Normal); //标准化法向量
	vec3 lightDir = normalize(lightPos - FragPos);//标准化光照方向向量

	float diff = max(dot(norm, lightDir), 0.0); //大于90度的（从背面照过来）的为0
	vec3 diffuse = diff * lightColor; //散射因子

	//镜面反射光照
	float specularStrength = 0.5f;//镜面强度
	vec3 viewDir = normalize(viewPos - FragPos); //观察方向
	vec3 reflectDir = reflect(-lightDir, norm); //反射光的方向
	float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32); //32次方。这个32是高光的发光值(Shininess)。一个物体的发光值越高，反射光的能力越强，散射得越少，高光点越小
	vec3 specular = specularStrength * spec * lightColor;

	vec3 result = (ambient + diffuse + specular) * objectColor;
    color = vec4(result, 1.0f);
}