extends RigidBody2D
class_name Ball

@export var collision_shape: CircleShape2D
@export var sprite: Sprite2D

var current_effects: Array[BallEffect]  # _check_current_effects() prevents having two of the same effect type


func add_effect(effect: BallEffect):
	_check_current_effects(effect)
	effect.apply_effect(self)
	get_tree().create_timer(effect.time).timeout.connect(_on_timer_timeout.bind(effect))
	current_effects.append(effect)


func _check_current_effects(effect: BallEffect):
	 # if there is an active effect of the same type, remove it
	for current_effect in current_effects:
		if current_effect.get_script() == effect.get_script():
			current_effect.remove_effect(self)
			current_effects.erase(current_effect)


func _on_timer_timeout(effect: BallEffect):
	# check if effect is active, if not, a removed effect will trigger timer
	if effect in current_effects:
		effect.remove_effect(self)
		current_effects.erase(effect)
