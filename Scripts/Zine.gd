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
	charge_pages()
	gere_couvertures()

	
func _input(event):
	if event.is_action_pressed("ui_focus_next"):
		fragmentsZine.set_fragment_zine(fragmentsZine.fragmentsZine+1)
	
	if consultationZine.visible == true:
		if event.is_action_pressed("ui_right"):
			if numPageCourant < fragmentsZine.fragmentsZine:
				numPageCourant += 2
				numPageCourant2 = (numPageCourant-1)
				charge_pages()
				gere_couvertures()
				print(fragmentsZine.fragmentsZine)
				print("num page courant1:",numPageCourant)
				print("num page courant2:", numPageCourant2)
			else:
				#chargée un texture de page vide
				if couverture == false && fragmentsZine.fragmentsZine > 0:
					couverture = true
					#pageD.chargImg("couv")
					
		if event.is_action_pressed("ui_left"):
			if numPageCourant > 0:
				numPageCourant -= 2
				numPageCourant2 = (numPageCourant-1)
				if couverture == true:
					couverture = false
					numPageCourant += 2
					numPageCourant2 += 2
				charge_pages()
				gere_couvertures()
				print(fragmentsZine.fragmentsZine)
				print("num page courant1:",numPageCourant)
				print("num page courant2:", numPageCourant2)
			
func _process(delta):
	pass

func gere_couvertures():
	if numPageCourant <= 0:
		p1.visible = false
	else:
		p1.visible = true
		
	if couverture == true || fragmentsZine.fragmentsZine == -1:
		p2.visible = false
	else:
		p2.visible = true

func charge_pages():
	if fragmentsZine.pages_eues[numPageCourant] :
		pageD.chargImg(str(numPageCourant))
	else :
		pageD.chargImg("fond_feuille")
	if fragmentsZine.pages_eues[numPageCourant2] :
		pageG.chargImg2(str(numPageCourant2))
	else :
		pageG.chargImg2("fond_feuille")
