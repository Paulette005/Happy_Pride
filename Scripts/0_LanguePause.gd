extends Control

var langues 
onready var Pause = get_node("/root/Node2D/CanvasLayer/Pause")
onready var Options = get_node("/root/Node2D/CanvasLayer/Options")

func _ready():
	var singleton = get_node("/root/Singleton")
	langues = singleton.langues
	chargement_langue()
	
func chargement_langue():
	if langues == 0:
		$Pause/Reprendre/Reprendre.bbcode_text = "[center]Reprendre[/center]"
		$Pause/Options/Options.bbcode_text = "[center]Options[/center]"
		$Pause/Retour/Retour.bbcode_text = "[center]Retour menu[/center]"
		$Pause/Quitter/Quitter.bbcode_text = "[center]Quitter[/center]"
		
	if langues == 1:
		$Pause/Reprendre/Reprendre.bbcode_text = "[center]Resume[/center]"
		$Pause/Options/Options.bbcode_text = "[center]Options[/center]"
		$Pause/Retour/Retour.bbcode_text = "[center]Back to menu[/center]"
		$Pause/Quitter/Quitter.bbcode_text = "[center]Quit[/center]"
		
func _on_Reprendre_pressed():
	Pause.visible = false
	get_tree().paused = false

func _on_Quitter_pressed():
	get_tree().quit()

func _on_Options_pressed():
	Pause.visible = false
	Options.visible = true
	get_node("/root/Node2D/CanvasLayer/Options/VBoxContainer/Langues").grab_focus()

func _on_Retour_pressed():
	Pause.visible = false
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
