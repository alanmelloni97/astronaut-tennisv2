class_name TournamentNameSpot
extends Control

@export var _player_name: Label


func set_character(character: Character) -> void:
	_player_name.text = character.name
	if character == Characters.get_current_rival():
		modulate = Color.YELLOW
	elif not character.beated:
		modulate = Color.RED
