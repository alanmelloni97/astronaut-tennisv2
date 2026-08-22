class_name ScoreManager
extends Node

signal game_finished(winner: int)
signal score_changed(score: Vector2i)

@export var win_score: int

var score: Vector2i = Vector2i.ZERO


func add_point(player: int):
	score[player - 1] += 1
	score_changed.emit(score)
	if score[player - 1] >= win_score:
		game_finished.emit(player)


func remove_points(player: int, point_amount):
	score[player - 1] -= point_amount
	score_changed.emit(score)
