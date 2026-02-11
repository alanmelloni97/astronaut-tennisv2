class_name RagdollSkinnerHelper
extends Node

@export var sprite_body: Sprite2D
@export var sprite_left_forearm: Sprite2D
@export var sprite_left_arm: Sprite2D
@export var sprite_right_forearm: Sprite2D
@export var sprite_right_arm: Sprite2D
@export var sprite_left_upper_leg: Sprite2D
@export var sprite_left_lower_leg: Sprite2D
@export var sprite_right_upper_leg: Sprite2D
@export var sprite_right_lower_leg: Sprite2D


func set_skin(skin: CharacterSkin):
	pass
	#sprite_body.texture = skin.body
	#sprite_left_forearm.texture = skin.left_forearm
	#sprite_left_arm.texture = skin.left_arm
	#sprite_right_forearm.texture = skin.right_forearm
	#sprite_left_upper_leg.texture = skin.left_upper_leg
	#sprite_left_lower_leg.texture = skin.left_lower_leg
	#sprite_right_upper_leg.texture = skin.right_upper_leg
	#sprite_right_lower_leg.texture = skin.right_lower_leg
