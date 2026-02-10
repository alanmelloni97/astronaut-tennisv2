extends CanvasLayer

signal torunament_menu_selected
signal options_menu_selected
signal two_player_menu_selected
signal quit_button_pressed

func _on_tournament_button_pressed() -> void:
	torunament_menu_selected.emit()


func _on_player_buttton_pressed() -> void:
	two_player_menu_selected.emit()


func _on_options_button_pressed() -> void:
	options_menu_selected.emit()


func _on_quit_button_pressed() -> void:
	quit_button_pressed.emit()
