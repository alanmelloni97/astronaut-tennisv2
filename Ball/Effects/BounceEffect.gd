class_name BounceBallEffect
extends Effect

@export var phyisics_material: PhysicsMaterial
@export var sound: AudioStream
@export var color: Color

var initial_physics_material: PhysicsMaterial
var initial_color: Color
var initial_sound: AudioStream


func _init() -> void:
	effect_type = EffectTypes.PHYSICS


func apply_effect(ball: Ball):
	initial_physics_material = ball.physics_material_override
	initial_color = ball.modulate
	initial_sound = ball.bounce_sound.stream
	ball.physics_material_override = phyisics_material
	ball.modulate = color
	ball.bounce_sound.stream = sound


func remove_effect(ball: Ball):
	ball.physics_material_override = initial_physics_material
	ball.modulate = initial_color
	ball.bounce_sound.stream = initial_sound
