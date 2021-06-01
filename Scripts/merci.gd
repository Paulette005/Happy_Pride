extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/retour.grab_focus()
	var singleton = Singleton
	if singleton.langues == 1:
		$merci.bbcode_text = "[wave]Thanks for playing[/wave]"
		$VBoxContainer/retour/retour.bbcode_text = "[center]Back to menu[/center]"
	$VBoxContainer/credits.connect("button_down",self,"to_credits")
	$VBoxContainer/retour.connect("button_down",self,"back_menu")
		
func back_menu():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
	
func to_credits():
	get_tree().change_scene("res://Scenes/Menu/Credits.tscn")
