#version 330 core

in vec3 inPos;

uniform mat4 modelView;   // view * model (calculada por IGlib)
uniform mat4 proj;        // proyección suministrada por el cliente

void main()
{
	gl_Position = proj * modelView * vec4(inPos, 1.0);
}
