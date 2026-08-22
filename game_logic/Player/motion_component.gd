class_name MotionManager
extends Node

@export var _rb: RigidBody2D
@export var _FORCE_MULT: int

var enabled: bool = true


func move_body(force: Vector2):
	if not enabled:
		return
	_rb.apply_central_force(force * _FORCE_MULT)
