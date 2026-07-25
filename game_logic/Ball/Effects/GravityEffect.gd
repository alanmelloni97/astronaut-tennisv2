class_name GravityBallEffect
extends Effect

@export var gravity: float
@export var sound: AudioStream
@export var texture: Texture2D

var initial_texture: Texture2D
var initial_gravity: float
var initial_sound: AudioStream


func _init() -> void:
	effect_type = EffectTypes.PHYSICS


func apply_effect(ball: Ball):
	initial_gravity = ball.mass
	initial_texture = ball.sprite.texture
	initial_sound = ball.bounce_sound.stream
	ball.gravity_scale = gravity
	ball.sprite.texture = texture
	ball.bounce_sound.stream = sound


func remove_effect(ball: Ball):
	ball.gravity_scale = initial_gravity
	ball.sprite.texture = initial_texture
	ball.bounce_sound.stream = initial_sound
