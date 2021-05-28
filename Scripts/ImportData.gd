extends Node

var dialogues_data
var dialogues_dataEN

func _ready():
	var dialoguesdata_file = File.new()
	dialoguesdata_file.open("res://Data/DialoguesDataFR.json",File.READ)
	var dialoguesdata_json = JSON.parse(dialoguesdata_file.get_as_text())
	dialoguesdata_file.close()
	dialogues_data = dialoguesdata_json.result
	
	var dialoguesdata_fileEN = File.new()
	dialoguesdata_fileEN.open("res://Data/DialoguesDataFR.json",File.READ)
	var dialoguesdataEN_json = JSON.parse(dialoguesdata_fileEN.get_as_text())
	dialoguesdata_fileEN.close()
	dialogues_dataEN = dialoguesdataEN_json.result
	
