extends Node2D


var prenomPNJ
var index_dialogueArray = 0
var numArray = 0
var nbframe = 0
var randomTemps = 2
var rdm = RandomNumberGenerator.new()
#Gestion de la direction pour gérer direction PNJ lors des dialogues
var dirPlayer
var messagefin = 0
var prenomFin = "Alex"
var playerZone = false

#permet de débloquer les morceaux du zine. Var passe true lorqu'on parle une fois à un pnj
export var interactionPNJ = false

onready var Player = get_node("/root/Node2D/Player")
onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var BoiteDialogues = get_node("/root/Node2D/CanvasLayer/Dialogues/BoiteDialogues")
onready var Interactions = get_node("/root/Node2D/CanvasLayer/Interactions")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
# Pour compter les morceaux de zine récoltés
onready var fragmentsZine = get_node("/root/Node2D")

func _ready():
	get_node("Area2D").connect("body_entered",self,"on_body_entered")
	get_node("Area2D").connect("body_exited", self, "on_body_exited")
	$Timer.connect("timeout", self, "chang_directions")
	
func on_body_entered(body):
	if body.name == "Player":
		playerZone = true
		Interactions.visible = true
		$AnimatedSprite.set_material(preload("res://Shaders/Outline.tres"))
		print(prenomPNJ)
		print("morceauZine: ", interactionPNJ)
		
func on_body_exited(body):
	if body.name == "Player":
		playerZone = false
		Interactions.visible = false
		if fragmentsZine.fragmentsZine == 12 && messagefin == 0:
			afficher_message_fin()
	
func chang_directions():
	# Random entre plusieurs valeurs, le résultat est ensuite contenu dans la var nbframe qui permet de changer la frame du personnage.
	if Dialogues.visible == false:
		rdm.randomize()
		nbframe = rdm.randi_range(0, 3)
		randomTemps = rdm.randi_range(2,6)
	
		$Timer.start(randomTemps)
		$AnimatedSprite.set_frame(nbframe)
		
func _input(event):
	if event.is_action_pressed("ui_accept") && playerZone:
		Interactions.visible = false
		if Player.dirPlayer <= 1:
			$AnimatedSprite.set_frame((Player.dirPlayer)+2)
		else:
			$AnimatedSprite.set_frame((Player.dirPlayer)-2)
			
		lancement_dialogue()
		
	if event.is_action_pressed("ui_accept") && Dialogues.visible == false && Interactions.visible == false && playerZone == false && consultationZine.visible == false:
			Player.lancerpaillettes()
		
	if event.is_action_pressed("ui_accept") && messagefin == 1:
		lancement_dialogue()
	
func afficher_message_fin():
	messagefin += 1
	parle()

func lancement_dialogue():
	if messagefin == 1:
		BoiteDialogues.DialoguesArray = ImportData.dialogues_data[prenomFin].Dial[numArray]
	else:
		BoiteDialogues.DialoguesArray = ImportData.dialogues_data[prenomPNJ].Dial[numArray]
	parle()
	
func parle():
	if index_dialogueArray < BoiteDialogues.DialoguesArray.size():
		if messagefin == 1:
			BoiteDialogues.PrenomPNJ = ImportData.dialogues_data[prenomFin].Prenom	
			BoiteDialogues.DialoguesPNJ = ImportData.dialogues_data[prenomFin].Dial[numArray][index_dialogueArray]
		else:
			BoiteDialogues.PrenomPNJ = ImportData.dialogues_data[prenomPNJ].Prenom	
			BoiteDialogues.DialoguesPNJ = ImportData.dialogues_data[prenomPNJ].Dial[numArray][index_dialogueArray]
			
		index_dialogueArray += 1
		Dialogues.visible = true
		BoiteDialogues.chargement_dialogue()
		
	else:
		Dialogues.visible = false
		index_dialogueArray = 0
		if interactionPNJ == false:
			fragmentsZine.fragmentsZine += 1
			interactionPNJ = true
			consultationZine.chargementPages()

		if Dialogues.visible == false && messagefin == 1:
			fragmentsZine.fragmentsZine += 1
			messagefin += 1
		#if numArray == 0:
		#	numArray += 1
