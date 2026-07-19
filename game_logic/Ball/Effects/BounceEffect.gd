class_name BounceBallEffect
extends Effect

@export var phyisics_material: PhysicsMaterial
@export var sound: AudioStream
@export var texture: Texture2D

var initial_physics_material: PhysicsMaterial
var initial_texture: Texture2D
var initial_sound: AudioStream


func _init() -> void:
	effect_type = EffectTypes.PHYSICS


func apply_effect(ball: Ball):
	initial_physics_material = ball.physics_material_override
	initial_texture = ball.sprite.texture
	initial_sound = ball.bounce_sound.stream
	ball.physics_material_override = phyisics_material
	ball.sprite.texture = texture
	ball.bounce_sound.stream = sound


func remove_effect(ball: Ball):
	ball.physics_material_override = initial_physics_material
	ball.sprite.texture = initial_texture
	ball.bounce_sound.stream = initial_sound
