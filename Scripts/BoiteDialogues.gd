extends Control

var PrenomPNJ = String("")
var DialoguesPNJ = String("")
var DialoguesArray = []

var mouvTriange = false

func _ready():
	chargement_dialogue()
	
func _process(delta):
	$AnimatedSprite.visible = mouvTriange

func chargement_dialogue():
	$Prenoms.bbcode_text = PrenomPNJ
	$Texte.bbcode_text = DialoguesPNJ
	# Chargement de la texture dans le Sprite
	$Portraits.texture = load("res://Assets/PNJ/Portraits/%s" %PrenomPNJ + ".png")
	mouvTriange = true
	$AnimatedSprite/AnimationPlayer.play("mouvTriangle")
