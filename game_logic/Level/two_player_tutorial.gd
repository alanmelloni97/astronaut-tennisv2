class_name TwoPlayerTutorial
extends Node

# static so that its saved between changing levels
static var two_player_tutorial_completed: bool

@export var player_1: Player
@export var player_2: Player
@export var wasd_sprite: Sprite2D
@export var arrows_sprite: Sprite2D
@export var level: Level

var wasd_hidden: bool = false:
	set(x):
		wasd_hidden = x
		wasd_sprite.hide()
var arrows_hidden: bool = false:
	set(x):
		arrows_hidden = x
		arrows_sprite.hide()


func _physics_process(_delta: float) -> void:
	# check if this is not the first time the script is ran
	if two_player_tutorial_completed:
		queue_free()
	if DisplayServer.is_touchscreen_available():
		arrows_hidden = true
		wasd_hidden = true
		return

	if player_1.racket.movement_handler._input_manager.input_axis != Vector2.ZERO:
		wasd_hidden = true
	if player_2.racket.movement_handler._input_manager:
		if player_2.racket.movement_handler._input_manager.input_axis != Vector2.ZERO:
			arrows_hidden = true
	if wasd_hidden and arrows_hidden:
		two_player_tutorial_completed = true
