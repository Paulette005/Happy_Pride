extends Camera2D

var target
export var Perso = "Node2D/Player"
var go = false

func _ready():
	target = get_node("/root/"+Perso)
	
func _physics_process(_delta):
	global_position = target.global_position
	if go == true:
		if offset.y >= -235:
			offset.y -= 2
	else:
		if offset.y != 0:
			offset.y += 2

func _on_Char01_gestionCamera():
	go = true

func _on_Char01_gestionCameraRetour():
	go = false
