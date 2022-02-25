extends Control

var volume
onready var singleton = get_node("/root/Singleton")
onready var Options = get_node("/root/Node2D/CanvasLayer/Options")

func _ready():
	volume = singleton.volume
	$EnsembleReglages/Musique.value = volume
	#singleton.samplePlayer
	_set_langue()

func _process(delta):
	volume = singleton.volume

func _set_langue():
	get_node("/root/Control/Credits").set_langue()
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
		
		$EnsembleReglages/luminosite.text = "Luminosité :"
		$EnsembleReglages2/Contraste.text = "Contraste :"
		$EnsembleReglages2/saturation.text = "Saturation :"
		$EnsembleReglages2/teinte.text = "Teinte :"
		$EnsembleReglages2/btonReinitialiser/reinitialiser.bbcode_text = "Réinitialiser les couleurs"
		
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
		
		$EnsembleReglages/luminosite.text = "Brightness :"
		$EnsembleReglages2/Contraste.text = "Contrast :"
		$EnsembleReglages2/saturation.text = "Saturation :"
		$EnsembleReglages2/teinte.text = "Hue :"
		$EnsembleReglages2/btonReinitialiser/reinitialiser.bbcode_text = "Reset color settings"
		
