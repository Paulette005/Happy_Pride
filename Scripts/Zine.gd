extends Control


onready var fragmentsZine = get_node("/root/Node2D")
onready var numPageCourant = -1
onready var p1 = $Pages/PageGauche
onready var p2 = $Pages/PageDroite

onready var page = get_node("Pages/PageDroite/Page")
onready var page2 = get_node("Pages/PageGauche/Page")

var interactionPNJ
var pages

func _ready():
	if interactionPNJ == true:
		print("test")
	

func _input(event):
	if Input.is_action_just_pressed("ui_right") && numPageCourant < 5:
		numPageCourant += 2
		#print(numPageCourant)
	if Input.is_action_just_pressed("ui_left") && numPageCourant > -1:
		numPageCourant -= 2
		#print(numPageCourant)

func _process(delta):
	if interactionPNJ == true:
		print("test")
	if numPageCourant == -1:
		p1.visible = false
	else:
		p1.visible = true
		#$Pages/PageGauche.visible = false
	if numPageCourant == 5:
		p2.visible = false
	else:
		p2.visible = true
	
func chargementPages():
	pages = load ("res://Scenes/Zine/Page.tscn").instance()
	page.chargImg()
	print("compte:",fragmentsZine.fragmentsZine)


	
