#version 330 core

in vec3 inPos;
uniform mat4 modelViewProj;

void main()
{
	if(mod(gl_VertexID, 4.0)==0.0)
		color = vec3(1.0,0.0,0.0);
	else if(mod(gl_VertexID, 4.0)==0.0)
		color = vec3(0.0,1.0,0.0);
	else if(mod(gl_VertexID, 4.0)==0.0)
		color = vec3(0.0,0.0,1.0);
	else if(mod(gl_VertexID, 4.0)==0.0)
		color = vec3(1.0,1.0,0.0);

	gl_Position = modelViewProj*vec4(inPos,1);

}
