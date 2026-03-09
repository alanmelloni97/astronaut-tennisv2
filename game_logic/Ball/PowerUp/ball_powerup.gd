class_name BallPowerUp
extends Area2D

@export var audio_stream_player_2d: AudioStreamPlayer2D
@export var powerup_sprites: Sprite2D
@export var background_sprite: Sprite2D
@export var inner_sprite: Sprite2D
@export var ROTATION: float

var power_up_data: PowerUpData:
	set(x):
		power_up_data = x
		inner_sprite.texture = power_up_data.texture
		audio_stream_player_2d.stream = power_up_data.sound


func _ready() -> void:
	_connect_signals()
	_fade_in()


func _physics_process(delta: float) -> void:
	background_sprite.rotation += ROTATION * delta


func destroy():
	audio_stream_player_2d.play()
	audio_stream_player_2d.reparent(get_parent())
	queue_free()


func _fade_in():
	powerup_sprites.scale = Vector2.ZERO
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(powerup_sprites, "scale", Vector2.ONE, 1.5).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)


func _connect_signals():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node):
	if body is Ball:
		body.add_effect(power_up_data.effect)
		destroy()
