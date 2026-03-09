class_name Ball
extends RigidBody2D

@warning_ignore_start("unused_signal")
signal anim_finished
signal _removed

@export var ai_marker_2d: Marker2D
@export var effects_manager: EffectsManager
@export var remove_sound: AudioStreamPlayer2D
# used by effects:
@export var collision_shape: CollisionShape2D
@export var sprite: Sprite2D
@export var bounce_sound: AudioStreamPlayer2D
@export var initial_color: Color


func _ready() -> void:
	modulate = initial_color


# WRAPPER
func add_effect(effect: Effect):
	effects_manager.add_effect(effect)


func remove():
	remove_sound.play()
	remove_sound.reparent(get_parent())
	_removed.emit()
	queue_free()
