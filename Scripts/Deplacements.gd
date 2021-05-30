extends KinematicBody2D

export var vitesse = 275
export (NodePath) var positionPlayer
export var dirPlayer = 0

var velocite = Vector2 ()
var direction = "Gauche"
var LancerParticules = preload("res://Scenes/Particules.tscn")
var gestionAnimations = false
var paillettes
var dansedanse

onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")

func _ready():
	$AnimatedSprite.connect("animation_finished", self, "chang_anim")
	$Timer.connect("timeout", self, "actionPlayer")
	var singleton = get_node("/root/Singleton")
	#global_position = singleton.posPlayerSingleton
	print(global_position)
	
	
func get_input():
	velocite = Vector2 ()
	if consultationZine.visible == false && Dialogues.visible == false:
		if Input.is_action_pressed("ui_up"):
			velocite.y -= 1
			direction = "Dos"
			dirPlayer = 2
		if Input.is_action_pressed("ui_down"):
			velocite.y += 1
			direction = "Face"
			dirPlayer = 0
		if Input.is_action_pressed("ui_left"):
			velocite.x -= 1
			direction = "Gauche"
			dirPlayer = 3
		if Input.is_action_pressed("ui_right"):
			velocite.x += 1
			direction = "Droite"
			dirPlayer = 1

		velocite = velocite.normalized() * vitesse
		
func _physics_process(delta):
	if !gestionAnimations:
		get_input()
		velocite = move_and_slide(velocite)
	
		# Lien avec le script Zindex
		z_index = global_position.y / 2
	
		if velocite.x == 0 && velocite.y == 0:
			$AnimatedSprite.play("Idle"+direction)
		else:
			$AnimatedSprite.play("Walk"+direction)
			
func chang_anim():
	gestionAnimations = false

#func gestiondanse():
#	if consultationZine.visible == false && Dialogues.visible == false:
#		$Timer.start(3)
#		dansedanse = true
		
func lancerpaillettes():
	if !gestionAnimations:
		gestionAnimations = true
		if direction == "Gauche" || direction == "Droite":
			$Timer.start(0.3)
			$AnimatedSprite.play("paillettes"+ direction)
			paillettes = true
		
func actionPlayer():
	if paillettes == true:
		if direction == "Gauche" || direction == "Droite":
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
			
	#if dansedanse == true:
	#	gestionAnimations = true
	#	$AnimatedSprite.play("WalkGauche")
	#	$Timer.stop()


