class_name Ragdoll
extends Node2D

@export var _skinner_helper: RagdollSkinnerHelper
# REFERENCES
@export var Rwrist: PinJoint2D
@export var Lwrist: PinJoint2D

var skin: CharacterSkin:
	set(skin):
		_skinner_helper.set_skin(skin)
