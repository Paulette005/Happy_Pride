extends TextureButton

onready var Pause = get_node("/root/Node2D/CanvasLayer/Pause")
onready var Options = get_node("/root/Node2D/CanvasLayer/Options")

onready var gestionLangues = get_node("/root/Node2D/CanvasLayer/Options/GestionLangues")
onready var ensembleReglages = get_node("/root/Node2D/CanvasLayer/Options/EnsembleReglages")
onready var singleton = get_node("/root/Singleton")

var langues
var volume

func _ready():
	get_node("/root/Node2D/CanvasLayer/Options/VBoxContainer/Langues").grab_focus()
	gestionLangues.visible = true
	langues = singleton.langues
	
func _on_Langues_pressed():
	gestionLangues.visible = true
	if singleton.langues == 0:
		get_node("/root/Node2D/CanvasLayer/Options/GestionLangues/Francais").grab_focus()
	else:
		get_node("/root/Node2D/CanvasLayer/Options/GestionLangues/Anglais").grab_focus()
			
	ensembleReglages.visible = false
	
func _on_Francais_pressed():
	langues = 0
	enregistrementLangues()

func _on_Anglais_pressed():
	langues = 1
	enregistrementLangues()
	
func enregistrementLangues():
	get_node("/root/Singleton").langues = langues
	
func _on_Retour2_pressed():
	gestionLangues.visible = false
	get_node("/root/Node2D/CanvasLayer/Options/VBoxContainer/Langues").grab_focus()

func _on_Retour_pressed():
	gestionLangues.visible = true
	ensembleReglages.visible = false
	Options.visible = false
	Pause.visible = true
	get_node("/root/Node2D/CanvasLayer/Pause/Pause/Reprendre").grab_focus()

func _on_Reglages_pressed():
	ensembleReglages.visible = true
	gestionLangues.visible = false

func _on_CheckButton_toggled(button_pressed):
	OS.center_window()
	OS.window_fullscreen = button_pressed

func _on_Musique_value_changed(value):
	get_node("/root/Singleton").volume = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), log(get_node("/root/Singleton").volume)*10)
