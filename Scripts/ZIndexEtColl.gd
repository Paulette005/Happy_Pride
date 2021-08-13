extends Sprite

var zone_coll = preload("res://Scenes/ZoneCollPnj.tscn")
export var add_collision = true

#onready var mouvCamera = get_node("/root/Node2D/Camera2D")

func _ready():
	z_index = global_position.y/2
	z_as_relative = false
	if add_collision :
		var zone_c = zone_coll.instance()
		add_child(zone_c)
	



