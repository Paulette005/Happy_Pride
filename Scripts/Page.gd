extends Control


#var interactionPNJ

onready var texture = $Background/Texture
#onready var BoiteDialogues = get_node("/root/Node2D/CanvasLayer/Dialogues/BoiteDialogues")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
onready var singleton = get_node("/root/Singleton")

func _ready():
	pass
	
func chargImg():
	if singleton.langues == 0:
		#$Background/Texture.texture = load("res://Assets/Zine/%s" %consultationZine.numPageCourant + ".jpg")
		#$Background/Texture.texture = load("res://Assets/Zine/0.png")
		$Background.texture = load("res://Assets/Zine/FR/0.png")
	else:
		$Background.texture = load("res://Assets/Zine/EN/0.png")

func chargImg2():
	if singleton.langues == 0:
		#$Background/Texture.texture = load("res://Assets/Zine/%s" %consultationZine.numPageCourant2 + ".jpg")
		$Background/Texture.texture = load("res://Assets/Zine/FR/2.png")
	else:
		$Background/Texture.texture = load("res://Assets/Zine/EN/2.png")
