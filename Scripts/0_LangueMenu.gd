extends Control

var volume
var langues
onready var singleton = get_node("/root/Singleton")
onready var samplePlayer = get_node("/root/Control/AudioStreamPlayer")

func _ready():
	volume = singleton.volume
	samplePlayer.play()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), log(get_node("/root/Singleton").volume)*10)
	chargement_langue()
	
func _process(delta):
	chargement_langue()
	
func chargement_langue():
	if singleton.langues == 0:
		$VBoxContainer/Commencer/Commencer.bbcode_text = "[center]Commencer[/center]"
		$VBoxContainer/Options/Options.bbcode_text = "[center]Options[/center]"
		$VBoxContainer/Credits/Credits.bbcode_text = "[center]Crédits[/center]"
		$VBoxContainer/Quitter/Quitter.bbcode_text = "[center]Quitter[/center]"
		$Credits/Retour/retour.bbcode_text= "[center]Retour[/center]"
		
	else:
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
		get_node("/root/Control/Credits/merci").text = "Thanks to Gabion, Dilz and Erwan for their help"
		$Credits/Retour/retour.bbcode_text= "[center]Back[/center]"


func _on_AudioStreamPlayer_finished():
	samplePlayer.play()
