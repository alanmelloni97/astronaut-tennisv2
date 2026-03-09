class_name Player
extends Node2D

enum PlayerType {
	PLAYER_1,
	PLAYER_2,
	AI_RIVAL,
}

@export var racket: Racket
@export var _ragdoll: Ragdoll


# WRAPPERS
func disable_input():
	racket.movement_handler.disable_input()


func set_up_player(player_type: PlayerType, skin: CharacterSkin):
	racket.movement_handler.set_player_type(player_type)
	set_player_hand(player_type)
	_ragdoll.skin = skin
	# make limbs weightless if AI
	if player_type == PlayerType.AI_RIVAL:
		for child in _ragdoll.body.get_children(true):
			if child is RigidBody2D:
				child.mass = 0.1


func set_player_hand(player_type: PlayerType):
	if player_type == PlayerType.PLAYER_1:
		racket.global_position = _ragdoll.Rwrist.global_position
		_ragdoll.Rwrist.node_b = racket.get_path()
	elif player_type == PlayerType.PLAYER_2 or player_type == PlayerType.AI_RIVAL:
		racket.global_position = _ragdoll.Lwrist.global_position
		_ragdoll.Lwrist.node_b = racket.get_path()
