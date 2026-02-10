class_name MotionManager
extends Node

@export var _rb: RigidBody2D
@export var _FORCE_MULT: int


func move_body(force: Vector2):
	_rb.apply_central_force(force * _FORCE_MULT)
