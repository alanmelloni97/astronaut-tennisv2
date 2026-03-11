extends Node

@export var two_player_tutorial: TwoPlayerTutorial
@export var tournament_tutorial: TournamentTutorial
@export var level: Level


func _ready() -> void:
	if level.two_player_mode:
		tournament_tutorial.queue_free()
	else:
		two_player_tutorial.queue_free()
