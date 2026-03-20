class_name StallBallDetector
extends Node

signal ball_stalled

var ball: Ball
# use vector modulus, if not velocity could add to 0 despite the ball moving to
# many directions (unlikely but possible)
var ball_velocity_acum: float
var frame_count: int


func _physics_process(delta: float) -> void:
	if get_tree().get_node_count_in_group("Ball") > 0:
		ball = get_tree().get_first_node_in_group("Ball")
		ball_velocity_acum += ball.linear_velocity.length() * delta
		frame_count += 1
		if frame_count % 300 == 0:
			frame_count = 0
			if ball_velocity_acum < 50: # moved less than 50 pixels in last 500 frames
				ball_stalled.emit()
			ball_velocity_acum = 0 # restart count
