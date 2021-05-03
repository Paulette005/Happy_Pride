extends KinematicBody2D

export var vitesse = 275
export (NodePath) var positionPlayer

var velocite = Vector2 ()
var direction = "Face"
var LancerParticules = preload("res://Scenes/Particules.tscn")


func _ready():
	var singleton = get_node("/root/Singleton")
	global_position = singleton.posPlayerSingleton
	print(global_position)

func get_input():
	velocite = Vector2 ()
	
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
	
	
func _physics_process(delta):
	get_input()
	velocite = move_and_slide(velocite)
	
		# Lien avec le script Zindex
	z_index = global_position.y / 2
	
	if velocite.x == 0 && velocite.y == 0:
		$AnimatedSprite.play("Idle"+direction)
	else:
		$AnimatedSprite.play("Walk"+direction)
	
	if Input.is_action_just_pressed("ui_accept"):
		var partInstance = LancerParticules.instance()
		partInstance.lancer_particules(global_position)
		get_parent().add_child(partInstance)
		
