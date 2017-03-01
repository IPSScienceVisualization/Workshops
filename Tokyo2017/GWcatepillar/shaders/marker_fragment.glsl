// Fragment shader for  Markers. A passed value (markerType) determines the type of marker drawn
uniform float uv_fade;
uniform float markerType;
uniform float displayMode;
in vec2 texcoord;
in vec4 color;
in float highlight;
out vec4 fragColor;

void main()
{
    vec2 fromCenter = texcoord * 2 - vec2(1);
	float dist2=dot(fromCenter,fromCenter);
	int pMarker =int(markerType); 
	fragColor = color;
	switch(pMarker) {
		case 0: //Gaussian Marker
			fragColor.a*=exp(-0.5*dist2/0.1);
			break;
		case 1: //Hard outlined circle with center dot
			if (dist2 >1.0) {
				fragColor.a=0.0;
			} else if (dist2<0.8 && dist2 >0.05) {
				fragColor.a*=0.45;
			} 
			break;
		case 2: //SOFTcircle with center dot
			if (dist2 >1.0) {
				fragColor.a=0.0;
			} else if (dist2 >0.2) {
				fragColor.a*=0.45;
			} 
			break;
		case 3: //Ring
			fragColor.a*=(2*sin(3.1415*dot(fromCenter,fromCenter)) -1.0);
			break;
		case 4: //Hard Circle
			if (dist2 > 1.0) {
				fragColor.a = 0.0;
			break;
			}
	}
	if (highlight >0.0 && dist2 <1.0 && dist2 >0.8) {
	  fragColor = fragColor +highlight*vec4(1.0,1.0,1.0,uv_fade);
	}
}
