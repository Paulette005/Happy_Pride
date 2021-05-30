extends VBoxContainer


var singleton


# Called when the node enters the scene tree for the first time.
func _ready():
	singleton = get_node("/root/Singleton")
	if singleton.clavier == "qwerty":
		$Qwerty.pressed = true
		$Azerty.pressed = false

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
