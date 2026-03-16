extends Node

@export var remove_particles: BallRemoveParticles


func _ready() -> void:
	if OS.get_name() == "Android":
		var particles: ParticleProcessMaterial = remove_particles.process_material
		particles.collision_mode = ParticleProcessMaterial.COLLISION_DISABLED
