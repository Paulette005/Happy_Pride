extends Node2D

var playerZone = false
var prenomPNJ
var index_dialogueArray = 0
var numArray = 0

var nbframe = 0
var randomTemps = 2
var rdm = RandomNumberGenerator.new()

# numArray indique le chiifre du tableau du dialogue, soit 0 ou 1

onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var BoiteDialogues = get_node("/root/Node2D/CanvasLayer/Dialogues/BoiteDialogues")

func _ready():
	get_node("Area2D").connect("body_entered",self,"on_body_entered")
	get_node("Area2D").connect("body_exited", self, "on_body_exited")
	
func on_body_entered(body):
	if body.name == "Player":
		playerZone = true
		
func on_body_exited(body):
	if body.name == "Player":
		playerZone = false
		Dialogues.visible = false
	
func _on_Timer_timeout():
	# Random entre plusieurs valeurs, le résultat est ensuite contenu dans la var nbframe qui permet de changer la frame du personnage.
	rdm.randomize()
	nbframe = rdm.randi_range(0, 3)
	randomTemps = rdm.randi_range(2,6)
	print("nombre de frame:", nbframe)
	
	$Timer.start(randomTemps)
	$AnimatedSprite.set_frame(nbframe)


func _input(event):
	if event.is_action_pressed("ui_accept") && playerZone:
		lancement_dialogue()
		
func lancement_dialogue():
	BoiteDialogues.DialoguesArray = ImportData.dialogues_data[prenomPNJ].Dial[numArray]
	parle()
	
func parle():
	if index_dialogueArray < BoiteDialogues.DialoguesArray.size():
		BoiteDialogues.PrenomPNJ = ImportData.dialogues_data[prenomPNJ].Prenom
		BoiteDialogues.DialoguesPNJ = ImportData.dialogues_data[prenomPNJ].Dial[numArray][index_dialogueArray]

		index_dialogueArray += 1
		Dialogues.visible = true
		BoiteDialogues.chargement_dialogue()
		
	else:
		Dialogues.visible = false
		index_dialogueArray = 0
		if numArray == 0:
			numArray += 1
