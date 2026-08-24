class_name RacketBuildConfig
extends Node

@export var racket: Racket
@export var damp: float
@export var force: int
@export var touchscreen_damp: float
@export var touchscreen_force: int
@export var casual_damp: float
@export var casual_force: int
@export var movement_handler: MovementHandler


func _ready() -> void:
	# avoid affecting ai
	if movement_handler.player_type == Player.PlayerType.AI_RIVAL:
		return
	if BuildConfig.difficulty == BuildConfig.Difficulty.TOUCHSCREEN:
		racket.linear_damp = touchscreen_damp
		racket.motion_manager._FORCE_MULT = touchscreen_force
	elif BuildConfig.difficulty == BuildConfig.Difficulty.CASUAL:
		racket.linear_damp = casual_damp
		racket.motion_manager._FORCE_MULT = casual_force
	else:
		racket.linear_damp = damp
		racket.motion_manager._FORCE_MULT = force
