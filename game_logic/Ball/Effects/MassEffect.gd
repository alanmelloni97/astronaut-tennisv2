class_name MassBallEffect
extends Effect

@export var mass: float
@export var sound: AudioStream
@export var texture: Texture2D

var initial_texture: Texture2D
var initial_mass: float
var initial_sound: AudioStream


func _init() -> void:
	effect_type = EffectTypes.PHYSICS


func apply_effect(ball: Ball):
	initial_mass = ball.mass
	initial_texture = ball.sprite.texture
	initial_sound = ball.bounce_sound.stream
	ball.mass = mass
	ball.sprite.texture = texture
	ball.bounce_sound.stream = sound


func remove_effect(ball: Ball):
	ball.mass = initial_mass
	ball.sprite.texture = initial_texture
	ball.bounce_sound.stream = initial_sound
