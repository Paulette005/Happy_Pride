extends KinematicBody2D

export var vitesse = 275
export (NodePath) var positionPlayer

var velocite = Vector2 ()
export var direction = "Face"
var LancerParticules = preload("res://Scenes/Particules.tscn")
var gestionAnimations = false
var paillettes
var dansedanse = false
var indicationDirection
var proche_pnj = false
var proche_sorie = false
var is_dancing = false
var verif = false

onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")
#onready var changementDir = get_node("/root/Node2D/Zones_specifiques/ChangementScene")

func _ready():
	$AnimatedSprite.connect("animation_finished", self, "chang_anim")
	$Timer.connect("timeout", self, "actionPlayer")
	var singleton = get_node("/root/Singleton")
	global_position = singleton.posPlayerSingleton

func get_input():
	velocite = Vector2 ()
	if consultationZine.visible == false && Dialogues.visible == false:
		if Input.is_action_pressed("ui_up"):
			velocite.y -= 1
			direction = "Dos"
		if Input.is_action_pressed("ui_down"):
			velocite.y += 1
			direction = "Face"
		if Input.is_action_pressed("ui_left"):
			velocite.x -= 1
			direction = "Gauche"
		if Input.is_action_pressed("ui_right"):
			velocite.x += 1
			direction = "Droite"
			
		velocite = velocite.normalized() * vitesse

func _input(event):
	if event.is_action_pressed("ui_accept") && consultationZine.visible == false && Dialogues.visible == false && proche_pnj == false && proche_sorie == false:
		lancerpaillettes()

func _physics_process(delta):
	if !gestionAnimations:
		get_input()
		velocite = move_and_slide(velocite)
	
		# Lien avec le script Zindex
		z_index = global_position.y / 2
	
		if velocite.x == 0 && velocite.y == 0 :
			if !is_dancing :
				$AnimatedSprite.play("Idle"+direction)
				if consultationZine.visible == false && Dialogues.visible == false:
					if dansedanse == false:
						dansedanse = true
						gestiondanse()
				else:
					$Timer.stop()
		else:
			$AnimatedSprite.play("Walk"+direction)
			dansedanse = false
			is_dancing = false
			$Timer.stop()
			
func chang_anim():
	if $AnimatedSprite.animation == "paillettesDroite" || $AnimatedSprite.animation == "paillettesGauche" :
		gestionAnimations = false

func gestiondanse():
	if consultationZine.visible == false && Dialogues.visible == false:
		$Timer.wait_time = 2
		$Timer.start(4)
		
func lancerpaillettes():
	if !gestionAnimations:
		gestionAnimations = true
		if direction == "Face":
			direction = "Gauche"
		if direction == "Dos":
			direction = "Droite"
		$Timer.start(0.3)
		$AnimatedSprite.frame = 0
		$AnimatedSprite.play("paillettes"+ direction)
		paillettes = true
		
func actionPlayer():
	if paillettes == true:
		var partInstance = LancerParticules.instance()
		if direction == "Droite":
			$Position2D.position.x = 138
			partInstance.lancer_particules($Position2D.global_position)
				
		if direction == "Gauche":
			$Position2D.position.x = -138
			partInstance.lancer_particules($Position2D.global_position)
		get_parent().add_child(partInstance)
		paillettes = false
	$Timer.stop()
			
	if !gestionAnimations:
		if dansedanse == true:
			is_dancing = true
			$AnimatedSprite.play("danse")

