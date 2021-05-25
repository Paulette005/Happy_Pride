extends Control


onready var texture = $Background/Texture
onready var fragmentsZine = get_node("/root/Node2D")
onready var BoiteDialogues = get_node("/root/Node2D/CanvasLayer/Dialogues/BoiteDialogues")
var PrenomPNJ

func _ready():
	pass
	
func chargImg():
	$Background/Texture.texture = load("res://Assets/Zine/%s" %BoiteDialogues.PrenomPNJ + ".png")
	print("chargee")

