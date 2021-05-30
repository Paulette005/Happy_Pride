extends TextureButton


func _ready():
	get_node("/root/Control/VBoxContainer/Commencer").grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Commencer_pressed():
	get_tree().change_scene("res://Scenes/Menu/Controles.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/Menu/Options.tscn")

func _on_Credits_pressed():
	get_node("/root/Control/Credits").visible = true
	get_node("/root/Control/Credits/Retour").grab_focus()

func _on_Quitter_pressed():
	get_tree().quit()
	
func _on_retour_credit_pressed():
	get_node("/root/Control/Credits").visible = false
	get_node("/root/Control/VBoxContainer/Commencer").grab_focus()
