extends Control


#var interactionPNJ

onready var texture = $Background/Texture
#onready var BoiteDialogues = get_node("/root/Node2D/CanvasLayer/Dialogues/BoiteDialogues")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
onready var singleton = get_node("/root/Singleton")

func _ready():
	pass
	
func chargImg(num_page):
	if singleton.langues == 0:
		#$Background/Texture.texture = load("res://Assets/Zine/%s" %consultationZine.numPageCourant + ".jpg")
		#$Background/Texture.texture = load("res://Assets/Zine/0.png")
		$Background.texture = load("res://Assets/Zine/FR/"+num_page+".png")
	else:
		$Background.texture = load("res://Assets/Zine/EN/"+num_page+".png")

func chargImg2(num_page):
	if singleton.langues == 0:
		#$Background/Texture.texture = load("res://Assets/Zine/%s" %consultationZine.numPageCourant2 + ".jpg")
		$Background/Texture.texture = load("res://Assets/Zine/FR/"+num_page+".png")
	else:
		$Background/Texture.texture = load("res://Assets/Zine/EN/"+num_page+".png")
