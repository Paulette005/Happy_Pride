extends Node2D


onready var prPartir = get_node("/root/Node2D/CanvasLayer/Partir")
onready var singleton = get_node("/root/Singleton")

func _ready():
	prPartir.visible = false

func _on_Area2D_body_entered(body):
	if singleton.fragmentsZine == 13:
		if body.name == "Player":
			prPartir.visible = true

func _on_Area2D_body_exited(body):
	if singleton.fragmentsZine == 13:
		if body.name == "Player":
			prPartir.visible = false
