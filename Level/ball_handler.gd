class_name BallHandler
extends Node

@export var _score_manager: ScoreManager
@export var _point_detectors: PointDetector
@export var ball_manager: BallManager


func _ready() -> void:
	_point_detectors.ball_double_bounced.connect(_on_ball_double_bounced)
	_score_manager.game_finished.connect(_on_game_finished)


func _on_ball_double_bounced(_side: int): # side 1: left, side 2: right
	ball_manager.destroy_ball()
	ball_manager.spawn_ball(0.5)


func _on_game_finished(_player):
	ball_manager.enabled = false
