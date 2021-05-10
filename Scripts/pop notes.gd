extends Node2D

var rand = RandomNumberGenerator.new()
export var tempo = 60

var notes = [preload("res://Scenes/effets/croche1.tscn"),
preload("res://Scenes/effets/croche2.tscn"),
preload("res://Scenes/effets/deux croches2.tscn"),
preload("res://Scenes/effets/deux croches 1.tscn"),
preload("res://Scenes/effets/noire.tscn"),
preload("res://Scenes/effets/ronde.tscn")]


# Called when the node enters the scene tree for the first time.
func _ready():
	rand.randomize()
	$Timer.connect("timeout",self,"pop_une_note")
	$Timer.wait_time = 60.0/tempo
	$Timer.start()


func pop_une_note():
	var r = rand.randi_range(0,5)
	var note = notes[r].instance()
	add_child(note)
	note.init(tempo)
	note.position = Vector2(rand.randf_range(-500,500),rand.randf_range(-200,200))
