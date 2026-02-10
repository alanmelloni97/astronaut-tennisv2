extends Control
class_name PauseMenu

signal unpaused
signal quit_game

@export var _options_menu: OptionsMenu


func _on_continue_button_pressed() -> void:
	unpaused.emit()


func _on_options_button_pressed() -> void:
	hide()
	_options_menu.show()


func _on_quit_button_pressed() -> void:
	quit_game.emit()


func _on_options_menu_closed_menu() -> void:
	show()
	_options_menu.hide()
