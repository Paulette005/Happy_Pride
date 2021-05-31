extends Area2D

export var nomScene = "MilieuCortege"
export var posX = 6174
var direction2
onready var posPlayer = get_node("/root/Node2D/Player")
onready var singleton = get_node("/root/Singleton")

func _ready():
	connect("body_entered", self, "on_body_entered")
	
func on_body_entered(body):
	if body.name == "Player":
		direction2 = posPlayer.direction
		print(direction2)
		get_node("/root/Singleton").posPlayerSingleton = Vector2 (posX, posPlayer.get_position().y)
		get_tree().change_scene("res://Scenes/"+nomScene+".tscn")
