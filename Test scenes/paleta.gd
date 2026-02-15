extends CharacterBody2D

@export var SPEED = 300.0
@export var contextbasedsteering: ContextBasedSteering
@export var target: Node2D

var chosen_dir: Vector2


func _physics_process(_delta: float) -> void:
	contextbasedsteering.target_position = target.global_position
	chosen_dir = contextbasedsteering.chosen_dir
	velocity = chosen_dir.rotated(rotation) * SPEED
	#print("chosen_dir", chosen_dir, " velocity: ", velocity)
	#rotation = velocity.angle()
	move_and_slide()
