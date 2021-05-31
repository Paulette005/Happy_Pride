extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("/root/Credits") != null:
		$retour.connect("button_down",self,"retour")
		$retour.visible = true
		$retour.grab_focus()
		

func retour():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
