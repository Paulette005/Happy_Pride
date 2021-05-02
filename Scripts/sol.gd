tool
extends Sprite


func calculate_size ():
	material.set_shader_param("rect_size", texture.get_size()*scale)
	pass
	
func _ready():
	material.set_shader_param("rect_size", texture.get_size()*scale)
