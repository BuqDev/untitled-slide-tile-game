shader_type canvas_item;

uniform float checker_size = 1.0f;
uniform sampler2D checker_512: repeat_enable;
uniform vec4 checker_color: source_color;

uniform float scale = 1;

void fragment() {
	vec2 center = vec2(.5, .5);
	float distance = length(UV - center);
	float hue = abs(distance * 1.0 / (scale / 2.0));
	float intensity = mix(1, 0, hue);

	float real_checker_size = checker_size * 2.0;
	vec4 color = checker_color * texture(checker_512, (UV * real_checker_size) - (vec2(.5) * real_checker_size));
	color.a = color.a * intensity;

	COLOR = color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
