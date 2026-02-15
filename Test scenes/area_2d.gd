extends Area2D

@export var ball: Ball


func _physics_process(_delta: float) -> void:
	global_position = ball.global_position
