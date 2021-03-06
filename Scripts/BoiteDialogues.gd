extends Control

var PrenomPNJ = String("")
var DialoguesPNJ = String("")
var DialoguesArray = []

var mouvTriange = false
onready var Pause = get_node("/root/Node2D/CanvasLayer/Pause")
onready var singleton = get_node("/root/Singleton")

func _ready():
	chargement_dialogue()
	
func _process(_delta):
	$AnimatedSprite.visible = mouvTriange
	
func chargement_dialogue():
	$Prenoms.bbcode_text = PrenomPNJ
	$Texte.bbcode_text = DialoguesPNJ
	# Chargement de la texture dans le Sprite
	if PrenomPNJ == "Khadija":
		$khadija.visible = true
		$Portraits.visible = false
		$AnimationPlayer.play("parle lsf")
	else :
		$khadija.visible = false
		$Portraits.visible = true
		$Portraits.texture = load("res://Assets/PNJ/Portraits/%s" %PrenomPNJ+".png")
		if PrenomPNJ == "Alex":
			$Portraits.visible = false
	mouvTriange = true
	$AnimatedSprite/AnimationPlayer.play("mouvTriangle")
