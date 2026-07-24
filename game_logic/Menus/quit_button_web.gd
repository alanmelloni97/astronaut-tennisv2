class_name QuitButtonWeb
extends Button


func _ready() -> void:
	if OS.get_name() == "Web" or OS.get_name() == "Android" or OS.get_name() == "iOS":
		hide()
