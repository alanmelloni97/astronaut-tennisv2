extends Node


@export var _ball: Ball

func _ready() -> void:
	_connect_signals()

	
func _connect_signals():
	_ball.body_entered.connect(_on_body_entered)

	
func _on_body_entered(body: Node):
	if body is BallPowerUp:
		body.effect.apply_effect(_ball)
