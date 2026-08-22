class_name MainUI
extends CanvasLayer

signal game_paused
signal game_unpaused
signal game_quit
signal game_ended
signal retry_requested
signal video_requested

@export var margin_container: MarginContainer
@export var mobile_margin: int
@export var pause_button: Button
@export var _pause_menu: PauseMenu
@export var _game_over_menu: GameOverMenu


func _ready() -> void:
	_game_over_menu.main_menu_pressed.connect(game_ended.emit)
	_game_over_menu.retry_pressed.connect(retry_requested.emit)
	_game_over_menu.watch_video_pressed.connect(video_requested.emit)
	_set_mobile_margins()


func show_game_over_menu(winner: int, two_players: bool):
	_game_over_menu.show_animated()
	_game_over_menu.set_up_menu(winner, two_players)


func hide_pause_menu():
	pause_button.hide()
	_pause_menu.hide()


func hide_reward_ad_button():
	_game_over_menu.video_button.hide()


func _on_pause_button_pressed() -> void:
	_pause_menu.show_animated()
	game_paused.emit()


func _on_pause_menu_quit_game() -> void:
	game_unpaused.emit()
	game_quit.emit()


func _on_pause_menu_unpaused() -> void:
	_pause_menu.hide_animated()
	game_unpaused.emit()


func _set_mobile_margins():
	if DisplayServer.is_touchscreen_available():
		margin_container.add_theme_constant_override("margin_top", mobile_margin)
		margin_container.add_theme_constant_override("margin_left", mobile_margin)
		margin_container.add_theme_constant_override("margin_bottom", mobile_margin)
		margin_container.add_theme_constant_override("margin_right", mobile_margin)
