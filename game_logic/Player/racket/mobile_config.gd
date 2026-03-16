class_name RacketBuildConfig
extends Node

@export var racket: Racket
@export var DAMP: float
@export var FORCE: int


func _ready() -> void:
	if DisplayServer.is_touchscreen_available():
		racket.linear_damp = DAMP
		racket.motion_manager._FORCE_MULT = FORCE
