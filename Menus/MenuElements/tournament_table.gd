class_name TournamentTable
extends Control

@export var tournament_spot_sc: PackedScene


func _ready() -> void:
	set_tournament_table(Characters.characters)


func set_tournament_table(characters: Array[Character]):
	# reverse so that last oponent is first
	var reversed_characters_array = characters.duplicate()
	reversed_characters_array.reverse()
	for character in reversed_characters_array:
		_create_tournament_spot(character)


func _create_tournament_spot(character: Character):
	var tournament_spot: TournamentNameSpot = tournament_spot_sc.instantiate()
	tournament_spot.set_character(character)
	add_child(tournament_spot)
