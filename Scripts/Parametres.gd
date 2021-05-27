extends Node2D

export var fragmentsZine = 1

onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var Pause = get_node("/root/Node2D/CanvasLayer/Pause")

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("consultationZine") && Dialogues.visible == false:
		if consultationZine.visible == false:
			consultationZine.visible = true
		else:
			consultationZine.visible = false
			
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		Pause.visible = true
		get_node("/root/Node2D/CanvasLayer/Pause/Pause/Reprendre").grab_focus()

