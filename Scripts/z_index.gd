extends AnimatedSprite

var zone_coll = preload("res://Scenes/ZoneCollPnj.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = global_position.y/2
	z_as_relative = false
	var zone_c = zone_coll.instance()
	add_child(zone_c)
