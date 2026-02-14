class_name BallManager
extends Node

@export var ball_sc: PackedScene
@export var _ball_spawn_point: Marker2D
@export var _level: Level

var enabled: bool = true
var _ball_reference: RigidBody2D


func _ready() -> void:
	spawn_ball(0)


func destroy_ball():
	_ball_reference.queue_free()


func spawn_ball(delay: float):
	if not enabled:
		return
	await get_tree().create_timer(delay).timeout
	var ball: RigidBody2D = ball_sc.instantiate()
	ball.global_position = _ball_spawn_point.global_position
	_level.add_child(ball)
	_ball_reference = ball
