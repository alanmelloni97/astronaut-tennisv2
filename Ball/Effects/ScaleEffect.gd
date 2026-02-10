extends BallEffect
class_name ScaleBallEffect

@export var scale: float
var _initial_radius: float
var _initial_scale: Vector2


func apply_effect(ball: Ball):
	_initial_radius = ball.collision_shape.radius
	_initial_scale = ball.sprite.scale
	ball.collision_shape.radius *= scale
	ball.sprite.scale = Vector2(scale, scale)


func remove_effect(ball: Ball):
	ball.collision_shape.radius = _initial_radius
	ball.sprite.scale = _initial_scale
