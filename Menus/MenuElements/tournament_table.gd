extends CanvasLayer
class_name TournamentTable

@export var tournament_spot_sc: PackedScene


func set_tournament_table(players_names: Array[String]):
	var i = 0
	for _name in players_names:
		i += 1
		_create_tournament_spot(i, _name)


func _create_tournament_spot(position: int, player_name: String):
	var tournament_spot: TournamentNameSpot = tournament_spot_sc.instantiate()
	tournament_spot.set_values(position, player_name)
	add_child(tournament_spot)
	
