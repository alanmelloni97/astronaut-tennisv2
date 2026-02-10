class_name Player
extends Node2D

@export var racket: Racket
@export var _ragdoll: Ragdoll


# WRAPPERS
func disable_input():
	racket.disable_input()


func set_up_player(player_type: Racket.PlayerType, skin: SkinResource, ai_area_detector: Area2D):
	racket.movement_handler.set_player_type(player_type)
	#racket.set_ball_detection_area(ai_area_detector)
	set_player_hand(player_type)
	_ragdoll.skin = skin


func set_player_hand(player_type: Racket.PlayerType):
	if player_type == Racket.PlayerType.PLAYER_1:
		_ragdoll.Rwrist.node_b = racket.get_path()
	elif player_type == Racket.PlayerType.PLAYER_2 or player_type == Racket.PlayerType.AI_RIVAL:
		_ragdoll.Lwrist.node_b = racket.get_path()
