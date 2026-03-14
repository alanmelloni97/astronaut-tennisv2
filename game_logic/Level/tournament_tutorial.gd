class_name TournamentTutorial
extends Node

# static so that its saved between changing levels
static var tournament_tutorial_completed: bool

@export var player_1: Player
@export var wasd_sprite: Sprite2D
@export var level: Level

var tween: Tween
var wasd_hidden: bool = false:
	set(x):
		wasd_hidden = x
		wasd_sprite.hide()


func _physics_process(_delta: float) -> void:
	# check if this is not the first time the script is ran
	if tournament_tutorial_completed:
		queue_free()
	if DisplayServer.is_touchscreen_available():
		wasd_hidden = true
		return

	if player_1.racket.movement_handler._input_manager.input_axis != Vector2.ZERO:
		wasd_hidden = true
		tournament_tutorial_completed = true
