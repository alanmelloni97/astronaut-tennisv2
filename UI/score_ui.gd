extends Control
class_name ScoreUI

@export var label_score_1: Label
@export var label_score_2: Label

func update_score(player: int, score: int):
	match player:
		1:
			label_score_1.text = str(score)
		2:
			label_score_2.text = str(score)
