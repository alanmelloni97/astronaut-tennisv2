extends Area2D
class_name BallPowerUp

@export var effect: BallEffect

func _ready() -> void:
	_connect_signals()
	
func _connect_signals():
	body_entered.connect(_on_body_entered)
	
func destroy():
	queue_free()
	
func _on_body_entered(body: Node):
	if body is Ball:
		body.add_effect(effect)
		destroy()
	
