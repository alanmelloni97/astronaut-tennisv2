extends Sprite2D

@export var _offset: float = 250

var tween: Tween
var initial_scale: Vector2


func _ready() -> void:
	initial_scale = scale
	spawn_anim()


func spawn_anim():
	tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", initial_scale, 0.5).from(Vector2.ZERO)
	tween.tween_callback(scale_animation)


func scale_animation():
	if tween:
		tween.kill()
	tween = create_tween().set_loops().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "offset:x", _offset, 1.5)
	tween.tween_property(self, "offset:x", -_offset, 1.5)
