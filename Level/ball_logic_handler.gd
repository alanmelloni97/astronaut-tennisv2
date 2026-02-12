class_name BallManager
extends Node

@export var ball_sc: PackedScene
@export var _lights_manager: LightsManager
@export var _point_detector: PointDetector
@export var _score_manager: ScoreManager
@export var _main_UI: MainUI
@export var _ball_spawn_point: Marker2D
@export var _level: Level

var _ball_reference: RigidBody2D


func _ready() -> void:
	_point_detector.ball_bounced.connect(_on_ball_bounced)
	_point_detector.ball_double_bounced.connect(_on_ball_double_bounced)
	spawn_ball(_ball_spawn_point.position, 0)


func spawn_ball(spawn_point: Vector2, delay: float):
	await get_tree().create_timer(delay).timeout
	var ball: RigidBody2D = ball_sc.instantiate()
	ball.global_position = spawn_point
	_level.add_child(ball)
	_ball_reference = ball


func destroy_ball():
	_ball_reference.queue_free()


func _on_ball_bounced(side: int):
	match side:
		1:
			_lights_manager.update_lights(true, false)
		2:
			_lights_manager.update_lights(false, true)


func _on_ball_double_bounced(side: int): # side 1: left, side 2: right
	match side:
		1:
			_score_manager.add_point(2)
			_main_UI.score_UI.update_score(2, _score_manager.score[1])
		2:
			_score_manager.add_point(1)
			_main_UI.score_UI.update_score(1, _score_manager.score[0])
	destroy_ball()
	spawn_ball(_ball_spawn_point.position, 0.5)
	_lights_manager.update_lights(false, false)
