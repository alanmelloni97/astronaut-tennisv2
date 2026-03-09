class_name TournamentNameSpot
extends Label


func set_character(character: Character) -> void:
	text = character.name
	if character == Characters.get_current_rival():
		modulate = Color.YELLOW
	elif not character.beated:
		modulate = Color.RED
