extends Sprite


var zone_coll = preload("res://Scenes/ZoneCollPnj.tscn")
export var add_collision = true

# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = global_position.y/2
	z_as_relative = false
	if add_collision :
		var zone_c = zone_coll.instance()
		add_child(zone_c)

func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()
