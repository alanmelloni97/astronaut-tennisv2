class_name Ragdoll
extends Node2D

@export var _skinner_helper: RagdollSkinnerHelper
# REFERENCES
@export var Rwrist: PinJoint2D
@export var Lwrist: PinJoint2D
@export var body: Node2D
@export var head_cs: CollisionShape2D

# only used if dog
var dog_head_collision_shape: Shape2D
var skin: CharacterSkin:
	set(skin):
		if not skin.dog:
			_skinner_helper.set_skin(skin)
		else:
			dog_head_collision_shape = head_cs.shape
