class_name ScoreManager
extends Node

signal game_finished(winner: int)

@export var win_score: int

var score: Vector2i = Vector2i.ZERO


func add_point(player: int):
	score[player - 1] += 1
	if score[player - 1] >= win_score:
		game_finished.emit(player)


func remove_points(player: int, point_amount):
	score[player - 1] -= point_amount
