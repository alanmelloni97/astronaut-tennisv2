class_name ContextBasedSteering
extends Node

@export var agent: Node2D
@export var RAYCAST_LENGHT: int
@export var num_rays: int = 32

var ball: Ball
var ray_directions: Array[Vector2]
var interest: Array[float]
var danger: Array[float]
var target_position: Vector2
var chosen_dir: Vector2 = Vector2.ZERO
var danger_raycasts: Array[RayCast2D]


func _ready() -> void:
	ray_directions.resize(num_rays)
	interest.resize(num_rays)
	danger.resize(num_rays)
	for i in num_rays:
		var angle = i * 2 * PI / num_rays
		ray_directions[i] = Vector2.RIGHT.rotated(angle)

		# set raycast
		var raycast = RayCast2D.new()
		raycast.set_collision_mask_value(1, false) # 1 is by default set
		raycast.set_collision_mask_value(7, true) # ContextSteering mask

		raycast.collide_with_areas = true
		raycast.target_position = Vector2.RIGHT.rotated(angle) * RAYCAST_LENGHT
		danger_raycasts.append(raycast)
		call_deferred("_add_raycast", raycast)


func _physics_process(_delta):
	ball = get_tree().get_first_node_in_group("Ball") # HACK should get reference
	set_interest()
	set_danger()
	choose_direction()


func set_interest():
	_set_custom_interest_parameters()
	for i in num_rays:
		# rotation is the agent rotation
		var target_direction: Vector2 = agent.global_position.direction_to(target_position)
		var d = ray_directions[i].rotated(agent.rotation).dot(target_direction)
		interest[i] = max(0, d)


func set_danger():
	for i in num_rays:
		danger[i] = 1.0 if danger_raycasts[i].is_colliding() else 0.0


func choose_direction():
	# Eliminate interest in slots with danger
	for i in num_rays:
		if danger[i] > 0.0:
			interest[i] = 0.0
	# Choose direction based on remaining interest
	chosen_dir = Vector2.ZERO
	for i in num_rays:
		chosen_dir += ray_directions[i] * interest[i]
		chosen_dir = chosen_dir.normalized()


func _set_custom_interest_parameters():
	# TODO retocar esto
	if target_position.y > agent.global_position.y:
		target_position.y += 300
	#target_position.x += ball.linear_velocity.x


func _add_raycast(raycast: RayCast2D):
	agent.add_child(raycast)
