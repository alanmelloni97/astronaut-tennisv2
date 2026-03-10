class_name ContextBasedSteering
extends Node

@export var agent: Node2D
@export var RAYCAST_LENGHT: int
@export var num_rays: int = 32
@export var pid_x: PIDController
@export var pid_y: PIDController
@export var debug_point: DebugPoint

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
	choose_direction(_delta)
	debug_point.point_pos = target_position


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


func choose_direction(delta: float):
	# Eliminate interest in slots with danger
	for i in num_rays:
		if danger[i] > 0.0:
			interest[i] = 0
	# Choose direction based on remaining interest
	chosen_dir = Vector2.ZERO
	for i in num_rays:
		chosen_dir += ray_directions[i] * interest[i]
		chosen_dir = chosen_dir.normalized()

	# Apply PID
	#if ball:
	##print(chosen_dir)
	#var target_value: float = agent.global_position.direction_to(ball.global_position).x
	#chosen_dir.x = pid_x.update(chosen_dir.x, target_value, delta)
	#print(chosen_dir.y)


func _set_custom_interest_parameters():
	pass
	# TODO retocar esto
	if ball:
		if ball.global_position.y > agent.global_position.y:
			target_position.x += 200
			target_position.y += 200
	# add x ball velocity to compensate when ball is going fast
	#if ball and ball.linear_velocity.x > 300:
	#target_position.x += ball.linear_velocity.x / 3
	### if ball is falling and agent is far, add ball y velocity
	#if target_position.y > agent.global_position.y:
	#target_position.y += 300


func _add_raycast(raycast: RayCast2D):
	agent.add_child(raycast)
