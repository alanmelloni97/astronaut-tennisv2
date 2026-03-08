class_name MassBallEffect
extends Effect

@export var mass: float
@export var sound: AudioStream
@export var color: Color

var initial_color: Color
var initial_mass: float
var initial_sound: AudioStream


func _init() -> void:
	effect_type = EffectTypes.PHYSICS


func apply_effect(ball: Ball):
	initial_mass = ball.mass
	initial_color = ball.modulate
	initial_sound = ball.bounce_sound.stream
	ball.mass = mass
	ball.modulate = color
	ball.bounce_sound.stream = sound


func remove_effect(ball: Ball):
	ball.mass = initial_mass
	ball.modulate = initial_color
	ball.bounce_sound.stream = initial_sound
