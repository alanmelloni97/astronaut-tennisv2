extends Node

@export var wasd_sprite: Sprite2D
@export var arrows_sprite: Sprite2D
@export var touch_tutorial_1: Sprite2D
@export var touch_tutorial_2: Sprite2D
@export var player_1: Player
@export var player_2: Player
@export var level: Level


func _ready() -> void:
	_check_touchscreen()
	_check_game_mode()


func _unhandled_input(_event: InputEvent) -> void:
	if player_1.racket.movement_handler._input_manager.input_axis != Vector2.ZERO:
		_hide_player_1()
	if level.two_player_mode:
		if player_2.racket.movement_handler._input_manager.input_axis != Vector2.ZERO:
			_hide_player_2()


func _check_touchscreen():
	if DisplayServer.is_touchscreen_available():
		wasd_sprite.hide()
		arrows_sprite.hide()
	else:
		touch_tutorial_1.hide()
		touch_tutorial_2.hide()


func _check_game_mode():
	if not level.two_player_mode:
		arrows_sprite.hide()
		touch_tutorial_2.hide()


func _hide_player_1():
	wasd_sprite.hide()
	touch_tutorial_1.hide()


func _hide_player_2():
	arrows_sprite.hide()
	touch_tutorial_2.hide()
