extends Control

var PrenomPNJ = String("")
var DialoguesPNJ = String("")
var DialoguesArray = []

func _ready():
	chargement_dialogue()

func chargement_dialogue():
	$Prenoms.bbcode_text = PrenomPNJ
	$Texte.bbcode_text = DialoguesPNJ
	# Chargement de la texture dans le Sprite
	$Portraits.texture = load("res://Assets/PNJ/Portraits/%s" %PrenomPNJ + ".png")
