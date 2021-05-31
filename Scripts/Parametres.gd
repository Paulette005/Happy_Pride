extends Node2D

var volume

export var fragmentsZine = 13

onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var Pause = get_node("/root/Node2D/CanvasLayer/Pause")

onready var singleton = get_node("/root/Singleton")

func _ready():
	volume = singleton.volume
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), log(get_node("/root/Singleton").volume)*10)

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


