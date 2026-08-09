class_name RacketBuildConfig
extends Node

@export var racket: Racket
@export var touchscreen_damp: float
@export var touchscreen_force: int


func _ready() -> void:
	if BuildConfig.difficulty == BuildConfig.Difficulty.CASUAL:
		racket.linear_damp = touchscreen_damp
		racket.motion_manager._FORCE_MULT = touchscreen_force
