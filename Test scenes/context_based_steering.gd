class_name ContextBasedSteering
extends RigidBody2D

var movement_speed: float = 15000.0

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.

	navigation_agent.target_position = $"../Ball".global_position
	# Make sure to not await during _ready.
	actor_setup.call_deferred()


func _physics_process(delta):
	#if navigation_agent.is_navigation_finished():
	#return
	navigation_agent.target_position = $"../Ball/Marker2D".global_position

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	var force = current_agent_position.direction_to(next_path_position) * movement_speed
	apply_central_force(force)


func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
