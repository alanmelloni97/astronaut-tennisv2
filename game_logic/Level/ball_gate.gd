extends AnimatedSprite2D

@export var ball_manager: BallManager


func _ready() -> void:
	ball_manager.spawned.connect(_on_ball_spawned)
	ball_manager.ejected.connect(_on_ball_ejected)


func _on_ball_spawned():
	play("open")


func _on_ball_ejected():
	play("close")
