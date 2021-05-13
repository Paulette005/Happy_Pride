extends AnimatedSprite

var i = 0
export var tempo = 62
export var is_pink_block = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = 60.0/tempo
	$Timer.start()
	print ($Timer.wait_time)


func on_timer_timeout():
	set_frame(i)
	visible = !visible
	i += 1
	if !is_pink_block && i >= 11 :
		i = 0
	if is_pink_block && i >= 4 :
		i = 0
