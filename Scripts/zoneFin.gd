extends Node2D

var fragmentsZine

onready var zonefin = get_node("/root/Node2D")
onready var prPartir = get_node("/root/Node2D/CanvasLayer/Partir")

func _ready():
	prPartir.visible = false

func _on_Area2D_body_entered(body):
	if zonefin.fragmentsZine == 13:
		if body.name == "Player":
			prPartir.visible = true

func _on_Area2D_body_exited(body):
	if zonefin.fragmentsZine == 13:
		if body.name == "Player":
			prPartir.visible = false
