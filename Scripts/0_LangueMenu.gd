extends Control

var langues
var volume
onready var singleton = get_node("/root/Singleton")

func _ready():
	langues = singleton.langues
	volume = singleton.volume
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), log(get_node("/root/Singleton").volume)*10)
	chargement_langue()
	
func chargement_langue():
	if langues == 0:
		$VBoxContainer/Commencer/Commencer.bbcode_text = "[center]Commencer[/center]"
		$VBoxContainer/Options/Options.bbcode_text = "[center]Options[/center]"
		$VBoxContainer/Credits/Credits.bbcode_text = "[center]Crédits[/center]"
		$VBoxContainer/Quitter/Quitter.bbcode_text = "[center]Quitter[/center]"
		
	if langues == 1:
		$VBoxContainer/Commencer/Commencer.bbcode_text = "[center]Play[/center]"
		$VBoxContainer/Options/Options.bbcode_text = "[center]Options[/center]"
		$VBoxContainer/Credits/Credits.bbcode_text = "[center]Credits[/center]"
		$VBoxContainer/Quitter/Quitter.bbcode_text = "[center]Quit[/center]"
		get_node("/root/Control/Credits/HBoxContainer/paulette/role fr").visible = false
		get_node("/root/Control/Credits/HBoxContainer/paulette/role en").visible = true
		get_node("/root/Control/Credits/HBoxContainer/Axell/role fr").visible = false
		get_node("/root/Control/Credits/HBoxContainer/Axell/role en").visible = true
		get_node("/root/Control/Credits/HBoxContainer/Rose/role fr").visible = false
		get_node("/root/Control/Credits/HBoxContainer/Rose/role en").visible = true		
		$Credits/Retour/retour.bbcode_text= "[center]Back[/center]"
