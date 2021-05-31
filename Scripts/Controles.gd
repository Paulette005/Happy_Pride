extends Control

var singleton


func _ready():
	singleton = get_node("/root/Singleton")
	if singleton.langues == 1 :
		$"controles fr".visible = false
		$"controles en".visible = true
		$indications.bbcode_text = "[wave]Press any key to start[/wave]"
	if singleton.clavier == "qwerty":
		$qwerty.visible = true

func _input(event):
	if event is InputEventKey and event.pressed:
		get_node("chargement").visible = true
		get_node("chargement/AnimationPlayer").play("chargement")
		get_node("/root/Singleton").change_scene("res://Scenes/TeteCortege.tscn")
	

