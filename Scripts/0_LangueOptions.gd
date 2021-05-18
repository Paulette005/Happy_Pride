extends Control

var langues

func _process(delta):
	var singleton = get_node("/root/Singleton")
	langues = singleton.langues
	
	if langues == 0:
		$VBoxContainer/Langues/Langues.bbcode_text = "Langues"
	if langues == 1:
		$VBoxContainer/Langues/Langues.bbcode_text = "Langues2"
