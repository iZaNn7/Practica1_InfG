#version 330 core

in vec3 inPos;

uniform mat4 modelViewProj;   // proj * view * model ya multiplicada en la CPU

void main()
{
	gl_Position = modelViewProj * vec4(inPos, 1.0);
}
