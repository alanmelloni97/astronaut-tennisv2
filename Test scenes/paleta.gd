extends RigidBody2D

@export var SPEED = 500.0
@export var contextbasedsteering: ContextBasedSteering
@export var target: Node2D

var chosen_dir: Vector2


func _physics_process(_delta: float) -> void:
	contextbasedsteering.target_position = target.global_position
	chosen_dir = contextbasedsteering.chosen_dir
	apply_force(chosen_dir.rotated(rotation) * SPEED)
