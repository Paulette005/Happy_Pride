extends Sprite

onready var mouvCamera = get_node("/root/Node2D/Camera2D")
signal gestionCamera
signal gestionCameraRetour

func _ready():
	z_index = global_position.y/2
	z_as_relative = false

func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		emit_signal("gestionCamera")
			
func _on_Area2D_body_exited(body):
	if body.name == "Player":
		emit_signal("gestionCameraRetour")

func _on_Timer_timeout():
	$AudioStreamPlayer2D.play()

