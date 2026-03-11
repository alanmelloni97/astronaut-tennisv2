class_name RacketAIManager
extends Node

@export var racket: Racket
@export var navigation_agent: NavigationAgent2D

var chosen_dir: Vector2
var input_axis: Vector2
var always_navigate: bool


func _ready():
	actor_setup.call_deferred()


func _physics_process(_delta: float) -> void:
	var ball: Ball = get_tree().get_first_node_in_group("Ball") as Ball
	if not ball:
		return
	# only follow ball if ball is on right side or always_navigate is set
	if always_navigate or ball.global_position.x > 950:
		navigation_agent.target_position = ball.ai_marker_2d.global_position
		var current_agent_position: Vector2 = racket.global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		input_axis = current_agent_position.direction_to(next_path_position)


func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
