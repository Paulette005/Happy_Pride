extends Node2D

var posPlayerSingleton = Vector2 (7967.333, -472.342)

var langues = 0
var volume = 0.4
var clavier = "azerty"
var fragmentsZine = 0

onready var samplePlayer = get_node("/root/Control/AudioStreamPlayer")

#pour le changement de scene
var loader
var wait_frame
var time_max = 100
var current_scene

func _ready():
	set_process(false)
	samplePlayer.play()

func change_scene(var path):
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count()-1)
	loader = ResourceLoader.load_interactive(path)
	wait_frame = 1
	set_process(true)

	
func _process(delta):
	if loader == null:
		set_process(false)
		return
	
	if wait_frame > 0:
		wait_frame -= 1
		return
	
	var t = OS.get_ticks_msec()
	while OS.get_ticks_msec() < t + time_max:
		var err = loader.poll()
		
		if err == ERR_FILE_EOF:
			var ressource = loader.get_resource()
			loader = null
			set_new_scene(ressource)
			break
		elif err == OK:
			pass
		else :
			#show_error()
			print("error")
			
func set_new_scene(r):
	current_scene.queue_free()
	current_scene = r.instance()
	get_node("/root").add_child(current_scene)
	get_tree().set_current_scene(current_scene)
		
	
