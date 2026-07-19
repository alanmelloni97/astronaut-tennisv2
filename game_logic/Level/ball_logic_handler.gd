class_name BallManager
extends Node

signal spawned
signal ejected

@export var ball_sc: PackedScene
@export var navigation_region: NavigationRegion2D
@export var _ball_spawn_point: Marker2D
@export var INITIAL_IMPULSE: Vector2

var enabled: bool = true
var _ball_reference: Ball


func destroy_ball():
	_ball_reference.remove()


func spawn_ball(delay: float):
	if not enabled:
		return
	await get_tree().create_timer(delay).timeout
	var ball: Ball = ball_sc.instantiate()
	ball.global_position = _ball_spawn_point.global_position
	navigation_region.add_child(ball)
	spawned.emit()
	# add sideways velocity to ball
	await ball.anim_finished
	var impulse_x: float = randf_range(-INITIAL_IMPULSE.x, INITIAL_IMPULSE.x)
	ball.apply_central_impulse(Vector2(impulse_x, INITIAL_IMPULSE.y))
	_ball_reference = ball
	ejected.emit()
