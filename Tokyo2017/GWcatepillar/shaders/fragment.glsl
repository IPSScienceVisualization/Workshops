
in vec4 color;
uniform float uv_fade;
uniform float alpha;
out vec4 fragColor;

void main()
{
    fragColor = color;
	fragColor.a*=alpha*uv_fade;

}
