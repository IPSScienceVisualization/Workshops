layout(triangles) in;
layout(triangle_strip, max_vertices = 4) out;

uniform float spriteRadius;
uniform float markerAlpha;
uniform float sizeType;
uniform float waveFactor;
uniform float length;
uniform mat4 uv_projectionMatrix;
uniform mat4 uv_modelViewMatrix;
uniform mat4 uv_modelViewInverseMatrix;
uniform mat4 uv_modelViewProjectionMatrix;
uniform float uv_simulationtimeSeconds;
uniform float uv_fade;

out vec2 texcoord;
out vec4 color;


mat3 rotationMatrix(vec3 axis, float angle) // axis should be normalized
{
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return mat3(oc * axis.x * axis.x + c,           oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c,           oc * axis.y * axis.z - axis.x * s,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c);
}

void drawSprite(vec4 position, float radius, float rotation)  // Camera facing square
{  
    vec3 objectSpaceUp = vec3(0, 0, 1);
    vec3 objectSpaceCamera = (uv_modelViewInverseMatrix * vec4(0, 0, 0, 1)).xyz;
    vec3 cameraDirection = normalize(objectSpaceCamera - position.xyz);
    vec3 orthogonalUp = normalize(objectSpaceUp - cameraDirection * dot(cameraDirection, objectSpaceUp));
    vec3 rotatedUp = rotationMatrix(cameraDirection, rotation) * orthogonalUp;
    vec3 side = cross(rotatedUp, cameraDirection);
    texcoord = vec2(0, 1);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (-side + rotatedUp), 1);
	EmitVertex();
    texcoord = vec2(0, 0);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (-side - rotatedUp), 1);
	EmitVertex();
    texcoord = vec2(1, 1);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (side + rotatedUp), 1);
	EmitVertex();
    texcoord = vec2(1, 0);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (side - rotatedUp), 1);
	EmitVertex();
	EndPrimitive();
}

void main()
{
    if(uv_fade<0.001)
        return;
 	color=vec4(0.2,0.8,1.0,markerAlpha*uv_fade);   
	vec4 colorBig= vec4(1.0,0.0,1.0,markerAlpha*uv_fade);
	vec4 colorSmall= vec4(1.0,1.0,0.0,markerAlpha*uv_fade);	
	float TWOPI=6.2831853;
    vec3 globalUp = vec3(0,1,0);
	float R=4.0;
	float phaseAngle = mod(0.5*gl_in[0].gl_Position.y+uv_simulationtimeSeconds,TWOPI);
	vec4 pos = vec4(R*sin(radians(gl_in[0].gl_Position.x))*(1.0+waveFactor*sin(phaseAngle)), R*cos(radians(gl_in[0].gl_Position.x))*(1.0-waveFactor*sin(phaseAngle)), gl_in[0].gl_Position.y, 1.0);
	
	float compress = sqrt(sin(radians(gl_in[0].gl_Position.x))*(1.0+sin(phaseAngle))
	   *sin(radians(gl_in[0].gl_Position.x))*(1.0+sin(phaseAngle)) +
	    cos(radians(gl_in[0].gl_Position.x))*(1.0-sin(phaseAngle))*
		cos(radians(gl_in[0].gl_Position.x))*(1.0-sin(phaseAngle)));
    color=mix(colorSmall,colorBig,compress/2.);
	
	if (length > gl_in[1].gl_Position.x) {
	  drawSprite(pos,0.5*spriteRadius,0.0);
	}
}
  
  
  
  