@abstract
class_name Effect
extends Resource

@export var sound: AudioStream

var time: float = 20


@abstract func apply_effect(ball: Ball)


@abstract func remove_effect(ball: Ball)
