class_name BallRemoveParticles
extends CPUParticles2D

@export var ball: Ball


func _ready() -> void:
	if OS.get_name() == "Web":
		queue_free()
	ball._removed.connect(_on_ball_removed)


func _on_ball_removed():
	reparent(ball.get_parent())
	emitting = true


func _on_finished() -> void:
	queue_free()
