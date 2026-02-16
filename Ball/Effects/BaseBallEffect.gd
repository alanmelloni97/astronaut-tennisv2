@abstract
class_name Effect
extends Resource

var time: float = 30


@abstract func apply_effect(ball: Ball)


@abstract func remove_effect(ball: Ball)
