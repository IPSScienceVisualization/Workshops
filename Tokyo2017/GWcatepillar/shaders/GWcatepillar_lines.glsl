layout(triangles) in;
layout(line_strip, max_vertices = 4) out;

uniform float spriteRadius;
uniform float markerAlpha;
uniform float sizeType;
uniform float waveFactor;
uniform float length;
uniform mat4 uv_projectionMatrix;
uniform mat4 uv_modelViewMatrix;
uniform mat4 uv_modelViewInverseMatrix;
uniform mat4 uv_modelViewProjectionMatrix;
uniform int uv_simulationtimeDays;
uniform float uv_simulationtimeSeconds;
uniform float uv_fade;
out vec4 color;

void main()
{
    if(uv_fade<0.001)
        return;
 	color=vec4(1.0,0.8,0.0,uv_fade);   
	float TWOPI=6.2831853;
    vec3 globalUp = vec3(0,1,0);
	float R=4.0;
	if (length > gl_in[1].gl_Position.x) {
		float phaseAngle = mod(0.5*gl_in[0].gl_Position.y+uv_simulationtimeSeconds,TWOPI);
		vec4 pos = vec4(R*sin(radians(gl_in[2].gl_Position.x))*(1.0+waveFactor*sin(phaseAngle)), R*cos(radians(gl_in[2].gl_Position.x))*(1.0-waveFactor*sin(phaseAngle)), gl_in[0].gl_Position.y, 1.0);
		gl_Position =  uv_modelViewProjectionMatrix *pos;
		EmitVertex();
		pos = vec4(R*sin(radians(gl_in[0].gl_Position.x))*(1.0+waveFactor*sin(phaseAngle)), R*cos(radians(gl_in[0].gl_Position.x))*(1.0-waveFactor*sin(phaseAngle)), gl_in[0].gl_Position.y, 1.0);
		gl_Position =  uv_modelViewProjectionMatrix *pos;
		EmitVertex();
		phaseAngle = mod(0.5*gl_in[2].gl_Position.y+uv_simulationtimeSeconds,TWOPI);
		pos = vec4(R*sin(radians(gl_in[0].gl_Position.x))*(1.0+waveFactor*sin(phaseAngle)), R*cos(radians(gl_in[0].gl_Position.x))*(1.0-waveFactor*sin(phaseAngle)), gl_in[2].gl_Position.y, 1.0);
		gl_Position =  uv_modelViewProjectionMatrix *pos;
		if (length -1.> gl_in[1].gl_Position.x) {EmitVertex();}
		EndPrimitive();
	}
}
  
  
  
  