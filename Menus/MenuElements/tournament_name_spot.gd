extends Control
class_name TournamentNameSpot

@export var _position_number: Label
@export var _player_name: Label

func set_values(tournament_position: int, player_name: String):
	_position_number.text = str(tournament_position)
	_player_name.text = player_name
