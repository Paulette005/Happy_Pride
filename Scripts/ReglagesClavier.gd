extends VBoxContainer


var singleton
onready var color_modif_mat = preload("res://Shaders/couleur_options_mat.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	singleton = get_node("/root/Singleton")
	if singleton.clavier == "qwerty":
		$Qwerty.pressed = true
		$Azerty.pressed = false
	_update_position_sliders()
	get_node("../EnsembleReglages2/contraste").connect("value_changed",self,"_contrast_slider")
	get_node("../EnsembleReglages2/Saturation").connect("value_changed",self,"_saturation_slider")
	get_node("../EnsembleReglages2/Teinte").connect("value_changed",self,"_hue_slider")
	get_node("../EnsembleReglages2/btonReinitialiser").connect("pressed",self,"_reinitialiser_couleurs")

func on_azerty_pressed(state):
	if state:
		$Qwerty.pressed = false
		set_azerty()
	else :
		$Qwerty.pressed = true
		set_qwerty()
	
func on_qwerty_pressed(state):
	if state:
		$Azerty.pressed = false
		set_qwerty()
	else :
		$Azerty.pressed = true
		set_azerty()

func set_azerty():
	singleton.clavier = "azerty"
	var z = InputEventKey.new()
	z.scancode = KEY_Z
	InputMap.action_add_event("ui_up",z)
	var w = InputEventKey.new()
	w.scancode = KEY_W
	InputMap.action_erase_event("ui_up",w)
	var q = InputEventKey.new()
	q.scancode = KEY_Q
	InputMap.action_add_event("ui_left",q)
	var a = InputEventKey.new()
	a.scancode = KEY_A
	InputMap.action_erase_event("ui_left",a)
	
func set_qwerty():
	singleton.clavier = "qwerty"
	var w = InputEventKey.new()
	w.scancode = KEY_W
	InputMap.action_add_event("ui_up",w)
	var z = InputEventKey.new()
	z.scancode = KEY_Z
	InputMap.action_erase_event("ui_up",z)
	var a = InputEventKey.new()
	a.scancode = KEY_A
	InputMap.action_add_event("ui_left",a)
	var q = InputEventKey.new()
	q.scancode = KEY_Q
	InputMap.action_erase_event("ui_left",q)

func _contrast_slider(value):
	color_modif_mat.set_shader_param("contrast",value)

func _luminosite_slider(value):
	color_modif_mat.set_shader_param("brightness",value)
	
func _saturation_slider(value):
	color_modif_mat.set_shader_param("saturation",value)
	
func _hue_slider(value):
	color_modif_mat.set_shader_param("hue_modif",value)

func _reinitialiser_couleurs():
	color_modif_mat.set_shader_param("contrast",1)
	color_modif_mat.set_shader_param("brightness",0)
	color_modif_mat.set_shader_param("saturation",1)
	color_modif_mat.set_shader_param("hue_modif",0)
	_update_position_sliders()

func _update_position_sliders():
	$lum.value = color_modif_mat.get_shader_param("brightness")
	get_node("../EnsembleReglages2/contraste").value = color_modif_mat.get_shader_param("contrast")
	get_node("../EnsembleReglages2/Saturation").value = color_modif_mat.get_shader_param("saturation")
	get_node("../EnsembleReglages2/Teinte").value = color_modif_mat.get_shader_param("hue_modif")
