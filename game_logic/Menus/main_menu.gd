class_name MainMenu
extends CanvasLayer

signal scene_requested(scene: PackedScene)

var two_players_requested: bool = false


func _on_tournament_button_pressed() -> void:
	scene_requested.emit(Scenes.character_selection)


func _on_player_buttton_pressed() -> void:
	two_players_requested = true
	scene_requested.emit(Scenes.character_selection)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
