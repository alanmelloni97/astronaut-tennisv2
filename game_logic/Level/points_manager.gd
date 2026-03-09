class_name ScoreManager
extends Node

signal game_finished(winner: int)

@export var WIN_SCORE: int
var score: Vector2i = Vector2i.ZERO

func add_point(player: int):
	score[player - 1] += 1
	if score[player - 1] >= WIN_SCORE:
		game_finished.emit(player)
