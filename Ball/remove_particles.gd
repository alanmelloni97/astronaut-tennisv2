class_name BallRemoveParticles
extends GPUParticles2D

@export var ball: Ball


func _ready() -> void:
	ball._removed.connect(_on_ball_removed)


func _on_ball_removed():
	reparent(owner.get_parent())
	emitting = true


func _on_finished() -> void:
	queue_free()
