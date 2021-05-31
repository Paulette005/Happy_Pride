extends Area2D

export var nomScene = "MilieuCortege"
export var posX = 6174
export var indicationDirection = "Gauche"

onready var posPlayer = get_node("/root/Node2D/Player")
#onready var singleton = get_node("/root/Singleton")

func _ready():
	connect("body_entered", self, "on_body_entered")
	#indicationDirection = posPlayer.direction
	
func on_body_entered(body):
	if body.name == "Player":
		indicationDirection = posPlayer.direction
		print("Direction: ", posPlayer.direction)
		get_node("/root/Singleton").posPlayerSingleton = Vector2 (posX, posPlayer.get_position().y)
		get_tree().change_scene("res://Scenes/"+nomScene+".tscn")
