shader_type spatial;
render_mode unshaded;

varying vec3 world_pos;

uniform vec3 sphere_center;
uniform vec3 light_dir;
uniform vec3 surface_color;

void vertex() 
{
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() 
{
	
	vec3 normal = normalize(world_pos - sphere_center);
	
	//vec3 light_dir = normalize(vec3(sin(TIME), cos(TIME), sin(TIME)));
	vec3 normal_light_dir = normalize(light_dir);
	float light = max(dot(normal, normal_light_dir), 0.0);
	
	light = max(light, 0.3);
	
	ALBEDO = surface_color * light;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
