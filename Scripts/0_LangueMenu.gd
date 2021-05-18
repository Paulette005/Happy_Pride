extends Control

var langues 


func _ready():
	chargement_langue()
	
func chargement_langue():
	if langues == 0:
		$VBoxContainer/Commencer/Commencer.bbcode_text = "Commencer"
		$VBoxContainer/Options/Options.bbcode_text = "Options"
		$VBoxContainer/Credits/Credits.bbcode_text = "Crédits"
		$VBoxContainer/Quitter/Quitter.bbcode_text = "Quitter"
		$VBoxContainer/Commencer/Commencer.margin_left = -79
		$VBoxContainer/Quitter/Quitter.margin_left = -50
		
	if langues == 1:
		$VBoxContainer/Commencer/Commencer.bbcode_text = "Play"
		$VBoxContainer/Options/Options.bbcode_text = "Options"
		$VBoxContainer/Credits/Credits.bbcode_text = "Credits"
		$VBoxContainer/Quitter/Quitter.bbcode_text = "Quit"
		$VBoxContainer/Commencer/Commencer.margin_left = -28
		$VBoxContainer/Quitter/Quitter.margin_left = -28
		
