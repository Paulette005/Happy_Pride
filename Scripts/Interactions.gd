extends Node2D

var prenomPNJ
var zine
var Zone
var index_dialogueArray = 0
var numArray = 0
var nbframe = 0
var randomTemps = 2
var rdm = RandomNumberGenerator.new()
#Gestion de la direction pour gérer direction PNJ lors des dialogues
var direction
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
onready var Partir = get_node("/root/Node2D/CanvasLayer/Partir")
onready var PositionPNJ = get_node("/root/Node2D/PNJ/" + prenomPNJ)

onready var singleton = get_node("/root/Singleton")

func _ready():
	get_node("Area2D").connect("body_entered",self,"on_body_entered")
	get_node("Area2D").connect("body_exited", self, "on_body_exited")
	$Timer.connect("timeout", self, "chang_directions")
	
func on_body_entered(body):
	if body.name == "Player":
		Player.proche_pnj = true
		playerZone = true
		Interactions.visible = true
		$AnimatedSprite.get_material().set_shader_param("width", 4.0)
		print(prenomPNJ)
		
func on_body_exited(body):
	if body.name == "Player":
		Player.proche_pnj = false
		playerZone = false
		Interactions.visible = false
		$AnimatedSprite.get_material().set_shader_param("width", 0.0)
		if singleton.comptefragmentsZine == 12 && messagefin == 0:
			afficher_message_fin()
		if singleton.zoneA == 4:
			afficher_message_fin()
		if Dialogues.visible == true:
			if messagefin == 0:
				sortie_dialogues_imprevue()
	
func chang_directions():
	# Random entre plusieurs valeurs, le résultat est ensuite contenu dans la var nbframe qui permet de changer la frame du personnage.
	if Dialogues.visible == false:
		rdm.randomize()
		nbframe = rdm.randi_range(0, 3)
		randomTemps = rdm.randi_range(2,6)
	
		$Timer.start(randomTemps)
		$AnimatedSprite.set_frame(nbframe)
		
func _input(event):
	if event.is_action_pressed("ui_accept") && playerZone && consultationZine.visible == false:
		Interactions.visible = false
		if Player.position.x > PositionPNJ.position.x:
			$AnimatedSprite.set_frame(1)
			Player.direction = "Gauche"
			if Player.position.y > (PositionPNJ.position.y + 35):
				$AnimatedSprite.set_frame(0)
				Player.direction = "Dos"
			if Player.position.y < (PositionPNJ.position.y - 25):
				$AnimatedSprite.set_frame(2)
				Player.direction = "Face"
				
		else:
			$AnimatedSprite.set_frame(3)
			Player.direction = "Droite"
			if Player.position.y > (PositionPNJ.position.y + 35):
				$AnimatedSprite.set_frame(0)
				Player.direction = "Dos"
			if Player.position.y < (PositionPNJ.position.y - 25):
				$AnimatedSprite.set_frame(2)
				Player.direction = "Face"
			
		lancement_dialogue()
		
	if event.is_action_pressed("ui_accept") && messagefin == 1:
		lancement_dialogue()
		
	if event.is_action_pressed("ui_accept") && Partir.visible == true:
		if singleton.comptefragmentsZine == 13:
			get_tree().change_scene("res://Scenes/Menu/merci.tscn")
	
func afficher_message_fin():
	messagefin += 1
	singleton.comptefragmentsZine += 1
	lancement_dialogue()

func lancement_dialogue():
	if messagefin == 0:
		if singleton.langues == 0:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_data[prenomPNJ].Dial[numArray]
		else:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_dataEN[prenomPNJ].Dial[numArray]
			
	else:
		if singleton.langues == 0:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_data[prenomFin].Dial[numArray]
		else:
			BoiteDialogues.DialoguesArray = ImportData.dialogues_dataEN[prenomFin].Dial[numArray]
			
	parle()
	
func parle():
	if index_dialogueArray < BoiteDialogues.DialoguesArray.size():
		if messagefin == 0:
			if singleton.langues == 0:
				BoiteDialogues.PrenomPNJ = ImportData.dialogues_data[prenomPNJ].Prenom	
				BoiteDialogues.DialoguesPNJ = ImportData.dialogues_data[prenomPNJ].Dial[numArray][index_dialogueArray]
			else:
				BoiteDialogues.PrenomPNJ = ImportData.dialogues_dataEN[prenomPNJ].Prenom	
				BoiteDialogues.DialoguesPNJ = ImportData.dialogues_dataEN[prenomPNJ].Dial[numArray][index_dialogueArray]
				
		else:
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
		if interactionPNJ == false:
			if Zone == "A":
				singleton.zoneA =+ 1
			elif Zone == "B":
				singleton.zoneB =+ 1
			else:
				singleton.zoneC =+1
			singleton.set_fragment_zine(zine)
			#singleton.comptefragmentsZine += 1
			interactionPNJ = true
			#consultationZine.chargementPages()
			print(singleton.zoneA)

		if Dialogues.visible == false && messagefin == 1:
			singleton.set_fragment_zine(zine)
			messagefin += 1
			if messagefin == 2:
				messagefin = 0
		#if numArray == 0:
		#	numArray += 1

func sortie_dialogues_imprevue():
	Dialogues.visible = false
	index_dialogueArray = 0
