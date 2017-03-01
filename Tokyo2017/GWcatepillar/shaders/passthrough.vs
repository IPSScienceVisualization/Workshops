in vec3 uv_vertexAttrib;

//Pass though
  
 void main()
 {
   gl_Position = vec4(uv_vertexAttrib,1.0);
 }
