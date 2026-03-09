class_name GameOverMenu
extends Control

signal retry_pressed
signal main_menu_pressed

@export var _game_over_label: Label
@export var _retry_button: Button


func set_up_menu(winner: int, two_players: bool):
	# by default menu shows 1 player lose status (retry button visible and YOU LOSE message)
	if two_players:
		if winner == 1:
			_game_over_label.text = "PLAYER 1 WINS"
		elif winner == 2:
			_game_over_label.text = "PLAYER 2 WINS"
	else:
		if winner == 1:
			_retry_button.hide()
			_game_over_label.text = "YOU WIN!"
		else:
			_game_over_label.text = "YOU LOST"


func _on_retry_button_pressed() -> void:
	retry_pressed.emit()


func _on_main_menu_button_pressed() -> void:
	main_menu_pressed.emit()
