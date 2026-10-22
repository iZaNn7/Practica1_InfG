#version 330 core

out vec4 outColor;
in vec2 texColor;

uniform sampler2D colorTex;


void main()
{
	//outColor = vec4(texture(colorTex; texCoord).rg, 0.5, 1.0); 
	
	outColor = vec4(texColor.st,0.0,1.0);
}