@abstract
extends Resource
class_name BallEffect

var time: float = 2.0

@abstract func apply_effect(ball: Ball)
@abstract func remove_effect(ball: Ball)
