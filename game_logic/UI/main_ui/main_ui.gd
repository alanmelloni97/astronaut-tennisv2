class_name MainUI
extends CanvasLayer

signal game_paused
signal game_unpaused
signal game_quit
signal game_ended
signal retry_requested

@export var _pause_menu: PauseMenu
@export var _game_over_menu: GameOverMenu


func _ready() -> void:
	_game_over_menu.main_menu_pressed.connect(game_ended.emit)
	_game_over_menu.retry_pressed.connect(retry_requested.emit)


func show_game_over_menu(winner: int, two_players: bool):
	_game_over_menu.show()
	_game_over_menu.set_up_menu(winner, two_players)


func _on_pause_button_pressed() -> void:
	_pause_menu.show()
	game_paused.emit()


func _on_pause_menu_quit_game() -> void:
	game_unpaused.emit()
	game_quit.emit()


func _on_pause_menu_unpaused() -> void:
	_pause_menu.hide()
	game_unpaused.emit()
