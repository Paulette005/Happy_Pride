extends Node2D

export var fragmentsZine = 1

onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")


func _ready():
	pass

func _input(event):
	if event.is_action_pressed("consultationZine") && Dialogues.visible == false:
		if consultationZine.visible == false:
			consultationZine.visible = true
		else:
			consultationZine.visible = false
			
	if event.is_action_pressed("pause"):
		print("test")

