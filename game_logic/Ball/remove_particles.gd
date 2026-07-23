class_name BallRemoveParticles
extends CPUParticles2D

@export var ball: Ball


func _ready() -> void:
	ball._removed.connect(_on_ball_removed)


func _on_ball_removed():
	reparent(ball.get_parent())
	emitting = true


func _on_finished() -> void:
	queue_free()
