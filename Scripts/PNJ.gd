extends Node2D

export var prenomPNJ = ""
var nbframe = 0
var randomTemps = 2
var rdm = RandomNumberGenerator.new()
	
func _on_Timer_timeout():
	# Random entre plusieurs valeurs, le résultat est ensuite contenu dans la var nbframe qui permet de changer la frame du personnage.
	rdm.randomize()
	nbframe = rdm.randi_range(0, 3)
	randomTemps = rdm.randi_range(2,6)
	print("nombre de frame:", nbframe)
	
	$Timer.start(randomTemps)
	$AnimatedSprite.set_frame(nbframe)

