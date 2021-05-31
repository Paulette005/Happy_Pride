extends Control


var singleton


# Called when the node enters the scene tree for the first time.
func _ready():
	singleton = get_node("/root/Singleton")
	if singleton.langues == 1 :
		$"controles fr".visible = false
		$"controles en".visible = true
		$indications.bbcode_text = "[rainbow]Press any key to start[/rainbow]"
	if singleton.clavier == "qwerty":
		$qwerty.visible = true

func _input(event):
	if event is InputEventKey and event.pressed:
		get_tree().change_scene("res://Scenes/TeteCortege.tscn")

