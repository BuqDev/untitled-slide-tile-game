shader_type spatial;
render_mode unshaded, depth_test_disabled;
stencil_mode read, compare_equal, 1;

uniform float offset;
uniform sampler2D shine_texture: repeat_enable;

uniform float zoomout = 1.0;

void vertex() {
	//POSITION = vec4(VERTEX.xy, 10.0, 10.0);
}

void fragment() {
	float aspect = VIEWPORT_SIZE.y / VIEWPORT_SIZE.x;
	vec4 color = texture(shine_texture, ((UV + vec2(UV.y/3.0, 0.0)) * zoomout / vec2(2.0, 0.0)) + vec2(offset, offset));
	ALBEDO = color.rgb;
	ALPHA = color.a / 2.0;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
