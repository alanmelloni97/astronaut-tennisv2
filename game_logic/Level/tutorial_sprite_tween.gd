extends Sprite2D

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
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CIRC).set_loops()
	tween.tween_property(self, "scale", initial_scale + Vector2(0.1, 0.1), 0.3)
	tween.tween_property(self, "scale", initial_scale, 0.3)
