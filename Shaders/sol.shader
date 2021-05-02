shader_type canvas_item ;

uniform vec2 rect_size;
uniform sampler2D sol_fond : hint_albedo ;
uniform vec2 texture_size;

void fragment(){
	vec2 tiled_UV = UV * rect_size/texture_size;
	COLOR = texture(sol_fond,tiled_UV);
}