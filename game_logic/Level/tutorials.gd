extends Node

@export var wasd_sprite: Sprite2D
@export var arrows_sprite: Sprite2D
@export var touch_tutorial_1: Sprite2D
@export var touch_tutorial_2: Sprite2D
@export var player_1: Player
@export var player_2: Player
@export var level: Level

var poki_paused: bool = true


func _ready() -> void:
	_check_if_should_show()
	_configure_touchscreen()
	_check_if_hide_player_2()


func _unhandled_input(_event: InputEvent) -> void:
	#ignore non actions
	if not _event.is_action_type():
		return
	# start game if poki
	if OS.has_feature("poki") and poki_paused:
		get_tree().paused = false
		poki_paused = false
	# hide tutorials on player movement
	if player_1.racket.movement_handler._input_manager.input_axis != Vector2.ZERO:
		_hide_player_1()
	if level.two_player_mode:
		if player_2.racket.movement_handler._input_manager.input_axis != Vector2.ZERO:
			_hide_player_2()
	# disable tutorial for future games (global variable)
	if _are_tutorials_not_visible():
		_disable_tutorial()


func _configure_touchscreen():
	if DisplayServer.is_touchscreen_available():
		wasd_sprite.hide()
		arrows_sprite.hide()
	else:
		touch_tutorial_1.hide()
		touch_tutorial_2.hide()


func _check_if_hide_player_2():
	if not level.two_player_mode:
		arrows_sprite.hide()
		touch_tutorial_2.hide()


func _check_if_should_show():
	if level.two_player_mode and GameState.two_player_tutorial_shown \
			or not level.two_player_mode and GameState.tournament_tutorial_shown:
		queue_free()


func _hide_player_1():
	wasd_sprite.hide()
	touch_tutorial_1.hide()


func _hide_player_2():
	arrows_sprite.hide()
	touch_tutorial_2.hide()


func _are_tutorials_not_visible():
	if (
		not wasd_sprite.visible and not touch_tutorial_1.visible \
				and not arrows_sprite.visible
		and not touch_tutorial_2.visible
	):
		return true
	return false


func _disable_tutorial():
	if level.two_player_mode:
		# disable also tournament since controls for player 1 were shown on 2 player mode
		GameState.tournament_tutorial_shown = true
		GameState.two_player_tutorial_shown = true
	else:
		GameState.tournament_tutorial_shown = true
