extends Camera2D

var target
export var Perso = "Node2D/Player"

func _ready():
	target = get_node("/root/"+Perso)
	
func _physics_process(delta):
	global_position = target.global_position
