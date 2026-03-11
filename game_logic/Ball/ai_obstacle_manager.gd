class_name AIObstacleManager
extends Node

@export var ball: Ball
@export var ai_obstacle_up: NavigationObstacle2D
@export var ai_obstacle_down: NavigationObstacle2D


func _physics_process(_delta: float) -> void:
	if ball.global_position.y > 650:
		ai_obstacle_up.affect_navigation_mesh = false
		ai_obstacle_down.affect_navigation_mesh = true
	else:
		ai_obstacle_up.affect_navigation_mesh = true
		ai_obstacle_down.affect_navigation_mesh = false
