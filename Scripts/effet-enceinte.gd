extends AnimatedSprite

var i = 0
export var tempo = 62

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = 60.0/tempo
	$Timer.start()
	print ($Timer.wait_time)

func on_timer_timeout():
	set_frame(i)
	visible = !visible
	i += 1
	if i >= 11 :
		i = 0