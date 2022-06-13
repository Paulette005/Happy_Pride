extends Node2D

var posPlayerSingleton = Vector2 (7905, -508)

var langues = 0
var volume = 0.4
var clavier = "azerty"
var fragmentsZine = -1
var comptefragmentsZine = 0
var pages_eues = [false,false,false,false,false,false,false,false,false,false,false,false,false]
var fullScreen = false

var zoneA = 0
var zoneB = 0
var zoneC = 0
#pour le changement de scene
var loader
var wait_frame
var time_max = 100
var current_scene

func _ready():
	set_process(false)
	
func set_fragment_zine(num):
	if num > fragmentsZine :
		fragmentsZine = num
	if pages_eues[num] == false:
		comptefragmentsZine += 1
	pages_eues[num] = true

	# dernier pnj qui fait apparaitre deux pages
	if num == 11 :
		fragmentsZine = 12
		pages_eues[12] = true
	get_node("/root/Node2D/CanvasLayer/Zine").add_fragment()
	get_node("/root/Node2D/CanvasLayer/Zine").charge_pages()
	get_node("/root/Node2D/CanvasLayer/Zine").gere_couvertures()
	
	print(comptefragmentsZine)

func change_scene(var path):
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count()-1)
	loader = ResourceLoader.load_interactive(path)
	wait_frame = 1
	set_process(true)
	
func _process(_delta):
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
		
	
