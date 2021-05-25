extends Node2D

export var fragmentsZine = 0
var prenomPNJ

onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("consultationZine"):
		if consultationZine.visible == false:
			consultationZine.visible = true
		else:
			consultationZine.visible = false
			
	if event.is_action_pressed("pause"):
		print("test")
		print(prenomPNJ)

