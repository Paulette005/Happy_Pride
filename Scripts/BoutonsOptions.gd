extends TextureButton

onready var gestionLangues = get_node("/root/Control/GestionLangues")
var langues  

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
