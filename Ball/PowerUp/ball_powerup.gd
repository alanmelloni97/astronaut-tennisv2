class_name BallPowerUp
extends Area2D

@export var sprite_2d: Sprite2D

var power_up_data: PowerUpData:
	set(x):
		power_up_data = x
		sprite_2d.texture = power_up_data.texture


func _ready() -> void:
	_connect_signals()


func destroy():
	queue_free()


func _connect_signals():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node):
	if body is Ball:
		body.add_effect(power_up_data.effect)
		destroy()
