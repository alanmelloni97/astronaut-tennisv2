class_name BounceBallEffect
extends Effect

@export var phyisics_material: PhysicsMaterial

var initial_physics_material: PhysicsMaterial
var initial_modulate: Color


func apply_effect(ball: Ball):
	initial_physics_material = ball.physics_material_override
	initial_modulate = ball.modulate
	ball.physics_material_override = phyisics_material
	ball.modulate = Color.DIM_GRAY


func remove_effect(ball: Ball):
	ball.physics_material_override = initial_physics_material
	ball.modulate = initial_modulate
