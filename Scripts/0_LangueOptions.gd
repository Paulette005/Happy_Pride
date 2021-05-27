extends Control

var langues

func _process(delta):
	var singleton = get_node("/root/Singleton")
	langues = singleton.langues

	if langues == 0:
		$VBoxContainer/Langues/Langues.bbcode_text = "Langues"
		$VBoxContainer/Langues/Langues.margin_left = -55
		$VBoxContainer/Reglages/Reglages.bbcode_text = "Réglages"
		$VBoxContainer/Reglages/Reglages.margin_left = -62
		$VBoxContainer/Retour/Retour.bbcode_text = "Retour"
		$VBoxContainer/Retour/Retour.margin_left = -46
		
		$GestionLangues/Francais/Francais.bbcode_text = "Français"
		$GestionLangues/Francais/Francais.margin_left = -48
		$GestionLangues/Anglais/Anglais.bbcode_text = "Anglais"
		$GestionLangues/Retour2/Retour2.bbcode_text = "Retour"
		$GestionLangues/Retour2/Retour2.margin_left = -47
	if langues == 1:
		$VBoxContainer/Langues/Langues.bbcode_text = "Languages"
		$VBoxContainer/Langues/Langues.margin_left = -70
		$VBoxContainer/Reglages/Reglages.bbcode_text = "Settings"
		$VBoxContainer/Reglages/Reglages.margin_left = -56
		$VBoxContainer/Retour/Retour.bbcode_text = "Back"
		$VBoxContainer/Retour/Retour.margin_left = -34
		
		$GestionLangues/Francais/Francais.bbcode_text = "French"
		$GestionLangues/Francais/Francais.margin_left = -45
		$GestionLangues/Anglais/Anglais.bbcode_text = "English"
		$GestionLangues/Retour2/Retour2.bbcode_text = "Back"
		$GestionLangues/Retour2/Retour2.margin_left = -34
