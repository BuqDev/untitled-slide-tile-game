shader_type canvas_item;

uniform vec4 color: source_color;
uniform float scale = 1;

void fragment() {
	vec2 center = vec2(.5, .5);
	float distance = length(UV - center);
	float hue = abs(distance * 1.0 / (scale / 2.0));
	float intensity = mix(1, 0, hue);
	
	vec4 c = color;
	c.a = c.a * intensity;
	
	COLOR = c;
}