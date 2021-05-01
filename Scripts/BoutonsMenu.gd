extends TextureButton

func _ready():
	get_node("/root/Control/VBoxContainer/Commencer").grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Commencer_pressed():
	get_tree().change_scene("res://Scenes/TeteCortege.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/FR/Options.tscn")

func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/FR/Credits.tscn")

func _on_Quitter_pressed():
	get_tree().quit()
