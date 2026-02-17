@abstract
class_name Effect
extends Resource

var time: float = 200


@abstract func apply_effect(ball: Ball)


@abstract func remove_effect(ball: Ball)
