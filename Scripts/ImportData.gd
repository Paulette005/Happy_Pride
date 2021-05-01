extends Node

var dialogues_data

func _ready():
	var dialoguesdata_file = File.new()
	dialoguesdata_file.open("res://Data/DialoguesData.json",File.READ)
	var dialoguesdata_json = JSON.parse(dialoguesdata_file.get_as_text())
	dialoguesdata_file.close()
	dialogues_data = dialoguesdata_json.result
	
