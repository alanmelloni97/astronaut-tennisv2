class_name BallPowerUp
extends Area2D

@export var audio_stream_player_2d: AudioStreamPlayer2D
@export var sprite_2d: Sprite2D
@export var power_up_data: PowerUpData: # export for testing
	set(x):
		power_up_data = x
		sprite_2d.texture = power_up_data.texture


func _ready() -> void:
	_connect_signals()
	_fade_in()


func destroy():
	audio_stream_player_2d.play()

	audio_stream_player_2d.reparent(get_parent())
	queue_free()


func _fade_in():
	sprite_2d.scale = Vector2.ZERO
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(sprite_2d, "scale", Vector2.ONE, 1.5).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)


func _connect_signals():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node):
	if body is Ball:
		body.add_effect(power_up_data.effect)
		destroy()
