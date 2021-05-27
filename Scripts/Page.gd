extends Control


#var interactionPNJ

onready var texture = $Background/Texture
#onready var BoiteDialogues = get_node("/root/Node2D/CanvasLayer/Dialogues/BoiteDialogues")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")

func _ready():
	pass
	
func chargImg():
	$Background/Texture.texture = load("res://Assets/Zine/%s" %consultationZine.numPageCourant + ".jpg")
	print("chargee")

func chargImg2():
	$Background/Texture.texture = load("res://Assets/Zine/%s" %consultationZine.numPageCourant2 + ".jpg")
