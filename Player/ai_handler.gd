class_name RacketAIManager
extends Node

@export var SPEED = 500.0
@export var context_based_steering: ContextBasedSteering
@export var racket: Racket

var target: Node2D
var chosen_dir: Vector2
var input_axis: Vector2


func _physics_process(_delta: float) -> void:
	var ball: Ball = get_tree().get_first_node_in_group("Ball") as Ball
	if ball:
		target = ball.ai_marker_2d
		context_based_steering.target_position = target.global_position
		chosen_dir = context_based_steering.chosen_dir
		input_axis = chosen_dir.rotated(racket.rotation) * SPEED
	else:
		input_axis = Vector2.ZERO
