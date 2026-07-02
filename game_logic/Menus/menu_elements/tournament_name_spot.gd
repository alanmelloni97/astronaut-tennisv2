class_name TournamentNameSpot
extends Label

@export var beated_color: Color
@export var current_color: Color
@export var unbeated_color: Color

func set_character(character: Character) -> void:
	text = character.name
	if character == Characters.get_current_rival():
		modulate = current_color
	elif not character.beated:
		modulate = unbeated_color
	else:
		modulate = beated_color
