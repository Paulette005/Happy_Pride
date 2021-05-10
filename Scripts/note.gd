extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout",self,"destroy")
	
func init(tempo):
	$Timer.wait_time = 60.0/tempo * 2
	$Timer.start()
	
func destroy():
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
