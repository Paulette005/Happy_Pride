extends Control

var volume
onready var singleton = get_node("/root/Singleton")
onready var Options = get_node("/root/Node2D/CanvasLayer/Options")

func ready():
	volume = singleton.volume
	
func _process(delta):
	volume = singleton.volume
	$EnsembleReglages/Musique.value = volume

	if singleton.langues == 0:
		$VBoxContainer/Langues/Langues.bbcode_text = "[center]Langues[/center]"
		$VBoxContainer/Reglages/Reglages.bbcode_text = "[center]Réglages[/center]"
		$VBoxContainer/Retour/Retour.bbcode_text = "[center]Retour[/center]"
		
		$GestionLangues/Francais/Francais.bbcode_text = "[center]Français[/center]"
		$GestionLangues/Anglais/Anglais.bbcode_text = "[center]Anglais[/center]"
		$GestionLangues/Retour2/Retour2.bbcode_text = "[center]Retour[/center]"
		
		$EnsembleReglages/CheckButton.text = "Plein Écran"
		$EnsembleReglages/Azerty.text = "Clavier AZERTY"
		$EnsembleReglages/Qwerty.text = "Clavier QWERTY"
		
	else:
		$VBoxContainer/Langues/Langues.bbcode_text = "[center]Languages[/center]"
		$VBoxContainer/Reglages/Reglages.bbcode_text = "[center]Settings[/center]"
		$VBoxContainer/Retour/Retour.bbcode_text = "[center]Back[/center]"
		
		$GestionLangues/Francais/Francais.bbcode_text = "[center]French[/center]"
		$GestionLangues/Anglais/Anglais.bbcode_text = "[center]English[/center]"
		$GestionLangues/Retour2/Retour2.bbcode_text = "[center]Back[/center]"
		
		$EnsembleReglages/CheckButton.text = "Full Screen"
		$EnsembleReglages/Azerty.text = "AZERTY keyboard"
		$EnsembleReglages/Qwerty.text = "QWERTY keyboard"
		
	if Options.visible == true:
		if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.playing = true
	else:
		$AudioStreamPlayer.playing = false
