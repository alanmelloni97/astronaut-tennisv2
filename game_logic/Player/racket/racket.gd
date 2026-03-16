class_name Racket
extends RigidBody2D

@export var movement_handler: MovementHandler
@export var motion_manager: MotionManager
@export var ai_manager: RacketAIManager
# used by dog player and racket setter
@export var sprite: Sprite2D
@export var collision_shape_2d: CollisionShape2D
@export var navigation_position: Marker2D


func apply_ai_level(level: AILevel):
	linear_damp = level.damp
	motion_manager._FORCE_MULT = level.force
	ai_manager.always_navigate = level.always_navigate
