extends Node2D


var i = 0
export var tempo = 60


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout",self,"bouge")
	$Timer.wait_time = 60.0/tempo
	$Timer.start()


func bouge():
	i+=1
	if i > 5 :
		i = 0
	$"ailes bleues".set_frame(i)
	$"ailes oranges".set_frame(i)
