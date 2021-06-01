extends Control

var couverture = false
var interactionPNJ

export var numPageCourant = 0
export var numPageCourant2 = 1

onready var p1 = $Pages/PageGauche
onready var p2 = $Pages/PageDroite
onready var pageD = get_node("Pages/PageDroite/Page")
onready var pageG = get_node("Pages/PageGauche/Page")
onready var fragmentsZine = get_node("/root/Singleton")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_focus_next"):
		fragmentsZine.fragmentsZine += 1
	
	if consultationZine.visible == true:
		if event.is_action_pressed("ui_right"):
			if numPageCourant < fragmentsZine.fragmentsZine:
				numPageCourant += 2
				numPageCourant2 = (numPageCourant-1)
				pageD.chargImg(str(numPageCourant))
				pageG.chargImg2(str(numPageCourant2))
				print(fragmentsZine.fragmentsZine)
				print("num page courant1:",numPageCourant)
				print("num page courant2:", numPageCourant2)
			else:
				#chargée un texture de page vide
				if couverture == false:
					couverture = true
					
		if event.is_action_pressed("ui_left"):
			if numPageCourant > 0:
				numPageCourant -= 2
				numPageCourant2 = (numPageCourant-1)
				if couverture == true:
					couverture = false
					numPageCourant += 2
					numPageCourant2 += 2
				pageD.chargImg(str(numPageCourant))
				pageG.chargImg2(str(numPageCourant2))
				print(numPageCourant)
				print("num page courant2:", numPageCourant2)
			
func _process(delta):
	if numPageCourant == 0:
		p1.visible = false
	else:
		p1.visible = true
		
	if couverture == true:
		p2.visible = false
	else:
		p2.visible = true
	
#func chargementPages():
#	print("compte:",fragmentsZine.fragmentsZine)


	
