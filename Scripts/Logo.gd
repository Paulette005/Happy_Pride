extends Control


func _ready():
	OS.center_window()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Timer.start(2)

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/FR/Menu.tscn")
