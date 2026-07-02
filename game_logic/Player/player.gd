class_name Player
extends Node2D

enum PlayerType {
	PLAYER_1,
	PLAYER_2,
	AI_RIVAL,
}

@export var racket: Racket
@export var _ragdoll: Ragdoll
@export var _dog_ragdoll_sc: PackedScene


# WRAPPERS
func disable_input():
	racket.movement_handler.disable_input()


func set_up_player(player_type: PlayerType, skin: CharacterSkin, racket_skin: Texture2D, ai_level: AILevel = null):
	racket.movement_handler.set_player_type(player_type)
	_set_ragdoll(player_type, skin)
	_set_racket(racket_skin)
	if player_type == PlayerType.AI_RIVAL:
		_set_ai(ai_level, skin)


func _set_racket(skin: Texture2D):
	racket.sprite.texture = skin


func _set_ragdoll(player_type: PlayerType, skin: CharacterSkin):
	if skin.dog:
		_ragdoll.queue_free()
		_ragdoll = _dog_ragdoll_sc.instantiate()
		add_child(_ragdoll)
		_ragdoll.skin = skin
		racket.sprite.hide()
		racket.racket_shape.shape = _ragdoll.head_cs.shape
		racket.racket_shape.position = Vector2.ZERO
		_ragdoll.Rwrist.node_b = racket.get_path()
		
		if player_type == PlayerType.PLAYER_1:
			_ragdoll.mirrored = true
	else:
		_set_player_hand(player_type)
		_ragdoll.skin = skin


func _set_player_hand(player_type: PlayerType):
	if player_type == PlayerType.PLAYER_1:
		racket.global_position = _ragdoll.Rwrist.global_position
		_ragdoll.Rwrist.node_b = racket.get_path()
	elif player_type == PlayerType.PLAYER_2 or player_type == PlayerType.AI_RIVAL:
		racket.global_position = _ragdoll.Lwrist.global_position
		_ragdoll.Lwrist.node_b = racket.get_path()


func _set_ai(ai_level: AILevel, skin: CharacterSkin):
	# set ai level
	racket.apply_ai_level(ai_level)
	# reduce mass of ai ( not if its dog)
	if skin.dog:
		return
	for child in _ragdoll.body.get_children(true):
		if child is RigidBody2D:
			child.mass = 0.1
