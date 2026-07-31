class_name ScoreHandler
extends Node

@export var bounce_detector: BounceDetector
@export var _score_manager: ScoreManager
@export var _score_ui: ScoreUI #HACK should have its handler
@export var point_sound: AudioStreamPlayer
@export var game_won_sound: AudioStreamPlayer
@export var game_lost_sound: AudioStreamPlayer
@export var level: Level


func _ready() -> void:
	bounce_detector.ball_double_bounced.connect(_on_double_bounced)
	_score_manager.game_finished.connect(_play_sound)


func _on_double_bounced(side: int):
	match side:
		1:
			_score_manager.add_point(2)
			_score_ui.update_score(2, _score_manager.score[1])
		2:
			_score_manager.add_point(1)
			_score_ui.update_score(1, _score_manager.score[0])


func _play_sound(winner):
	# if a player wins, play gameoversound
	var game_sound: AudioStreamPlayer
	if level.two_player_mode:
		game_sound = game_won_sound
	else:
		if winner == 1:
			game_sound = game_won_sound
		else:
			game_sound = game_lost_sound
	game_sound.play()
