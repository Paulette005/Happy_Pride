extends Node2D

var prenomFin = "Alex"
var indicationZone = false
var index_dialogueArray = 0
var numArray = 0
var rdm = RandomNumberGenerator.new()

onready var Player = get_node("/root/Node2D/Player")
onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var BoiteDialogues = get_node("/root/Node2D/CanvasLayer/Dialogues/BoiteDialogues")
onready var prPartir = get_node("/root/Node2D/CanvasLayer/Partir")
onready var singleton = get_node("/root/Singleton")

func _ready():
	prPartir.visible = false

func _on_Area2D_body_entered(body):
	if singleton.comptefragmentsZine == 13:
		if body.name == "Player":
			prPartir.visible = true

	if body.name == "Player":
		Player.proche_sorie = true
		indicationZone = true
		lancement_dialogue()

func _on_Area2D_body_exited(body):
	if singleton.comptefragmentsZine == 13:
		if body.name == "Player":
			prPartir.visible = false

	if body.name == "Player":
		Player.proche_sorie = false
		indicationZone = false
			
func _input(event):
	if event.is_action_pressed("ui_accept") && indicationZone:
		lancement_dialogue()
		
func lancement_dialogue():
	if singleton.zoneA == 3 || singleton.zoneB == 3:
		if singleton.langues == 0:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_data[prenomFin].Dial[numArray]
		else:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_dataEN[prenomFin].Dial[numArray]
			
	else:
		if singleton.langues == 0:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_data[prenomFin].Dial[numArray]
		else:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_dataEN[prenomFin].Dial[numArray]
			
	parle()
	
func parle():
	if index_dialogueArray < BoiteDialogues.DialoguesArray.size():
		if singleton.langues == 0:
			BoiteDialogues.PrenomPNJ = ImportData.dialogues_data[prenomFin].Prenom
			BoiteDialogues.DialoguesPNJ = ImportData.dialogues_data[prenomFin].Dial[numArray][index_dialogueArray]
		else:
			BoiteDialogues.PrenomPNJ = ImportData.dialogues_dataEN[prenomFin].Prenom
			BoiteDialogues.DialoguesPNJ = ImportData.dialogues_dataEN[prenomFin].Dial[numArray][index_dialogueArray]
				
		index_dialogueArray += 1
		Dialogues.visible = true
		BoiteDialogues.chargement_dialogue()
		
	else:
		Dialogues.visible = false
		index_dialogueArray = 0
