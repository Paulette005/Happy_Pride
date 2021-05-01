extends Node2D


func lancer_particules(pos):
	position = pos
	$Particles2D.emitting = true
	
	if $Particles2D.emitting == false:
		queue_free()
