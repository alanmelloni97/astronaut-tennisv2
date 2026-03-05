@abstract
class_name Effect
extends Resource

enum EffectTypes { SCALE, PHYSICS }

var effect_type: EffectTypes
var time: float = 20


@abstract func apply_effect(ball: Ball)


@abstract func remove_effect(ball: Ball)
