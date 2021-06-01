extends Control
var path = "/root/Control/Credits/"

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("/root/Credits") != null:
		path = "/root/Credits/"
		$retour.connect("button_down",self,"retour")
		$retour.visible = true
		$retour.grab_focus()
	set_langue()

func set_langue():
	var singleton = get_node("/root/Singleton")
	if singleton.langues == 1:
		get_node(path + "HBoxContainer/paulette/role fr").visible = false
		get_node(path + "HBoxContainer/paulette/role en").visible = true
		get_node(path + "HBoxContainer/Axell/role fr").visible = false
		get_node(path + "HBoxContainer/Axell/role en").visible = true
		get_node(path + "HBoxContainer/Rose/role fr").visible = false
		get_node(path + "HBoxContainer/Rose/role en").visible = true
		get_node(path + "merci").text = "Thanks to Gabion, Dilz and Erwan for their help"
		$retour/retour.bbcode_text= "[center]Back[/center]"
	else :
		get_node(path + "HBoxContainer/paulette/role fr").visible = true
		get_node(path + "HBoxContainer/paulette/role en").visible = false
		get_node(path + "HBoxContainer/Axell/role fr").visible = true
		get_node(path + "HBoxContainer/Axell/role en").visible = false
		get_node(path + "HBoxContainer/Rose/role fr").visible = true
		get_node(path + "HBoxContainer/Rose/role en").visible = false
		get_node(path + "merci").text = "Merci à Gabion, Dilz et Erwan pour leur aide"
		$retour/retour.bbcode_text= "[center]Retour[/center]"

func retour():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
