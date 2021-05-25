extends Node2D

export var tempo = 60
var persos_dansent = []
var is_init = false
var rand = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_node("../").get_children()
	for c in children :
		if c.has_method("saute") :
			persos_dansent.append(c)
	$Timer.connect("timeout",self,"saut")
	$Timer.wait_time = 60.0/tempo
	$Timer.start()

func saut():
	if !is_init:
		for p in persos_dansent :
			p.init(tempo)
		is_init = true
	var r = rand.randi_range(0,persos_dansent.size()-1)
	var p = persos_dansent[r]
	p.saute()
