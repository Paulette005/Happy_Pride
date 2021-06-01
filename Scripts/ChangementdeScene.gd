extends Area2D

export var nomScene = "MilieuCortege"
export var posX = 6174

onready var posPlayer = get_node("/root/Node2D/Player")

func _ready():
	connect("body_entered", self, "on_body_entered")
	
func on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Singleton").posPlayerSingleton = Vector2 (posX, posPlayer.get_position().y)
		get_tree().change_scene("res://Scenes/"+nomScene+".tscn")
