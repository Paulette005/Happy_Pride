extends Control


var singleton


# Called when the node enters the scene tree for the first time.
func _ready():
	singleton = get_node("/root/Singleton")
	if singleton.langues == 1 :
		$"controles fr".visible = false
		$"controles en".visible = true
	if singleton.clavier == "qwerty":
		$qwerty.visible = true

func _input(event):
	if event is InputEventKey and event.pressed:
		get_node("chargement").visible = true
		get_node("chargement/AnimationPlayer").play("chargement")
		get_node("/root/Singleton").change_scene("res://Scenes/TeteCortege.tscn")
	

