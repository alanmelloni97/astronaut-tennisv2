class_name ScoreHandler
extends Node

@export var bounce_detector: BounceDetector
@export var _score_manager: ScoreManager
@export var _score_ui: ScoreUI #HACK should have its handler
@export var point_sound: AudioStreamPlayer
@export var game_over_sound: AudioStreamPlayer


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
	_play_sound()


func _play_sound():
	# if a player wins, play gameoversound
	if _score_manager.score.x == _score_manager.WIN_SCORE or \
	_score_manager.score.y == _score_manager.WIN_SCORE:
		game_over_sound.play()
	else:
		point_sound.play()
