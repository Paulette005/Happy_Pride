extends TextureButton

onready var gestionLangues = get_node("/root/Control/GestionLangues")
onready var ensembleReglages = get_node("/root/Control/EnsembleReglages")

var langues
var volume

func _ready():
	get_node("/root/Control/VBoxContainer/Langues").grab_focus()
	
	var singleton = get_node("/root/Singleton")
	langues = singleton.langues
	
func _on_Langues_pressed():
	if gestionLangues.visible == false:
		gestionLangues.visible = true
		if langues == 0:
			get_node("/root/Control/GestionLangues/Francais").grab_focus()
		else:
			get_node("/root/Control/GestionLangues/Anglais").grab_focus()
			
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
	get_node("/root/Control/VBoxContainer/Langues").grab_focus()

func _on_Retour_pressed():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")

func _on_Reglages_pressed():
	ensembleReglages.visible = true
	gestionLangues.visible = false

func _on_CheckButton_toggled(button_pressed):
	OS.window_maximized = button_pressed
	OS.center_window()

func _on_Musique_value_changed(value):
	get_node("/root/Singleton").volume = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), log(get_node("/root/Singleton").volume)*10)
