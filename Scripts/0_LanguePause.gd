extends Control

onready var Pause = get_node("/root/Node2D/CanvasLayer/Pause")
onready var Options = get_node("/root/Node2D/CanvasLayer/Options")
onready var singleton = get_node("/root/Singleton")

func _ready():
	pass
	
func _process(_delta):
	if singleton.langues == 0:
		$Pause/Reprendre/Reprendre.bbcode_text = "[center]Reprendre[/center]"
		$Pause/Options/Options.bbcode_text = "[center]Options[/center]"
		$Pause/Retour/Retour.bbcode_text = "[center]Retour menu[/center]"
		$Pause/Quitter/Quitter.bbcode_text = "[center]Quitter[/center]"
		
	if singleton.langues == 1:
		$Pause/Reprendre/Reprendre.bbcode_text = "[center]Resume[/center]"
		$Pause/Options/Options.bbcode_text = "[center]Options[/center]"
		$Pause/Retour/Retour.bbcode_text = "[center]Back to menu[/center]"
		$Pause/Quitter/Quitter.bbcode_text = "[center]Quit[/center]"
		
func _on_Reprendre_pressed():
	Pause.visible = false
	get_tree().paused = false

func _on_Quitter_pressed():
	get_tree().quit()

func _on_Options_pressed():
	Pause.visible = false
	Options.visible = true
	get_node("/root/Node2D/CanvasLayer/Options/VBoxContainer/Langues").grab_focus()

func _on_Retour_pressed():
	Pause.visible = false
	get_tree().paused = false
	singleton.fragmentsZine = -1
	singleton.comptefragmentsZine = 0
	singleton.pages_eues = [false,false,false,false,false,false,false,false,false,false,false,false,false]
	singleton.posPlayerSingleton = Vector2 (7905, -508)
	singleton.zoneA = 0
	singleton.zoneB = 0
	singleton.zoneC = 0
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
