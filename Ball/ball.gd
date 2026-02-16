class_name Ball
extends RigidBody2D

@export var ai_marker_2d: Marker2D
@export var effects_manager: EffectsManager
# used by effects:
@export var collision_shape: CollisionShape2D
@export var sprite: Sprite2D


# WRAPPER
func add_effect(effect: Effect):
	effects_manager.add_effect(effect)
# TODO add particles
