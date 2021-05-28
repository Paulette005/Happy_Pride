extends Sprite


var zone_coll = preload("res://Scenes/ZoneCollPnj.tscn")
export var add_collision = true
var timer
var start_position
var en_lair = false

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position
	z_index = global_position.y/2
	z_as_relative = false
	if add_collision :
		var zone_c = zone_coll.instance()
		add_child(zone_c)
	timer = Timer.new()
	add_child(timer)
	timer.set_name("Timer")
	timer.one_shot = true
	timer.connect("timeout",self,"descend")
	
	#print (timer.name)

func init(tempo):
	print ("init")
	$Timer.wait_time = 2 * 60.0/tempo
	
func saute():
	if !en_lair:
		en_lair = true
		position = Vector2(start_position.x,start_position.y - 50)
		$Timer.start()

func descend():
	en_lair = false
	position = start_position
