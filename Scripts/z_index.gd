extends AnimatedSprite


func _ready():
	z_as_relative = false
	z_index = global_position.y / 2
