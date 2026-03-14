class_name BallHandler
extends Node

@export var _score_manager: ScoreManager
@export var bounce_detector: BounceDetector
@export var ball_manager: BallManager
@export var stall_ball_detector: StallBallDetector


func _ready() -> void:
	bounce_detector.ball_double_bounced.connect(_on_ball_double_bounced)
	_score_manager.game_finished.connect(_on_game_finished)
	stall_ball_detector.ball_stalled.connect(_on_ball_stalled)

	ball_manager.spawn_ball(0)


func _on_ball_double_bounced(_side: int): # side 1: left, side 2: right
	ball_manager.destroy_ball()
	ball_manager.spawn_ball(0)


func _on_ball_stalled():
	ball_manager.destroy_ball()
	ball_manager.spawn_ball(0)


func _on_game_finished(_player):
	ball_manager.enabled = false
