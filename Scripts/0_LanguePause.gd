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
		$Pause/Reprendre/Reprendre.bbcode_text = "Reprendre"
		$Pause/Options/Options.bbcode_text = "Options"
		$Pause/Quitter/Quitter.bbcode_text = "Quitter"
		$Pause/Reprendre/Reprendre.margin_left = -69
		$Pause/Quitter/Quitter.margin_left = -50
		
	if langues == 1:
		$Pause/Reprendre/Reprendre.bbcode_text = "Resume"
		$Pause/Options/Options.bbcode_text = "Options"
		$Pause/Quitter/Quitter.bbcode_text = "Quit"
		$Pause/Reprendre/Reprendre.margin_left = -54
		$Pause/Quitter/Quitter.margin_left = -28
		
func _on_Reprendre_pressed():
	Pause.visible = false
	get_tree().paused = false

func _on_Quitter_pressed():
	get_tree().quit()

func _on_Options_pressed():
	Options.visible = true
	Pause.visible = false
	get_node("/root/Node2D/CanvasLayer/Options/VBoxContainer/Langues").grab_focus()
