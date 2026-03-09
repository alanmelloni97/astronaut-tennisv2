class_name ScoreHandler
extends Node

@export var bounce_detector: BounceDetector
@export var _score_manager: ScoreManager
@export var _score_ui: ScoreUI #HACK should have its handler


func _ready() -> void:
	bounce_detector.ball_double_bounced.connect(_on_double_bounced)


func _on_double_bounced(side: int):
	match side:
		1:
			_score_manager.add_point(2)
			_score_ui.update_score(2, _score_manager.score[1])
		2:
			_score_manager.add_point(1)
			_score_ui.update_score(1, _score_manager.score[0])
