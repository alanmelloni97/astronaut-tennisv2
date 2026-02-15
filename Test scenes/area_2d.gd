extends Area2D

@onready var ball: Ball = $".."


func _physics_process(delta: float) -> void:
	global_position = ball.global_position
