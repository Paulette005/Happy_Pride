extends KinematicBody2D

export var vitesse = 275
export (NodePath) var positionPlayer
export var dirPlayer = 0

var velocite = Vector2 ()
var direction = "Face"
var LancerParticules = preload("res://Scenes/Particules.tscn")
var gestionAnimations = false

#onready var ZineInteractions = get_node("/root/Node2D/CanvasLayer/Zine")
onready var Dialogues = get_node("/root/Node2D/CanvasLayer/Dialogues")
onready var consultationZine = get_node("/root/Node2D/CanvasLayer/Zine")

func _ready():
	$AnimatedSprite.connect("animation_finished", self, "chang_anim")
	#$AnimatedSprite.connect("frame_changed", self, "frame_changed")
	#$Timer.connect("timeout", self, "dansedanse")
	var singleton = get_node("/root/Singleton")
	#global_position = singleton.posPlayerSingleton
	print(global_position)
	
				
func _input(event):
	if Dialogues.visible == false && consultationZine.visible == false:
		if event.is_action_pressed("ui_accept") && !gestionAnimations:
			gestionAnimations = true
			$AnimatedSprite.play("paillettes"+direction)
			var partInstance = LancerParticules.instance()
			partInstance.lancer_particules(global_position)
			get_parent().add_child(partInstance)
		
	if event.is_action_pressed("consultationZine"):
		if consultationZine.visible == false:
			consultationZine.visible = true
		else:
			consultationZine.visible = false
			
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

#func dansedanse():
#	gestionAnimations = true
#	$AnimatedSprite.play("WalkGauche")
#	print("test")

