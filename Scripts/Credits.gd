extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("/root/Credits") != null:
		$retour.connect("button_down",self,"retour")
		$retour.visible = true
		$retour.grab_focus()
		var singleton = get_node("/root/Singleton")
		if singleton.langues == 1:
			get_node("/root/Credits/HBoxContainer/paulette/role fr").visible = false
			get_node("/root/Credits/HBoxContainer/paulette/role en").visible = true
			get_node("/root/Credits/HBoxContainer/Axell/role fr").visible = false
			get_node("/root/Credits/HBoxContainer/Axell/role en").visible = true
			get_node("/root/Credits/HBoxContainer/Rose/role fr").visible = false
			get_node("/root/Credits/HBoxContainer/Rose/role en").visible = true
			get_node("/root/Credits/merci").text = "Thanks to Gabion, Dilz and Erwan for their help"
			$retour/retour.bbcode_text= "[center]Back[/center]"
		else:
			print("teeeee")

func retour():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
