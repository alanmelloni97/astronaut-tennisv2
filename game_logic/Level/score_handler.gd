class_name ScoreHandler
extends Node

@export var bounce_detector: BounceDetector
@export var point_sound: AudioStreamPlayer
@export var game_won_sound: AudioStreamPlayer
@export var game_lost_sound: AudioStreamPlayer
@export var level: Level
@export var _score_manager: ScoreManager


func _ready() -> void:
	bounce_detector.ball_double_bounced.connect(_on_double_bounced)
	_score_manager.game_finished.connect(_play_game_over_sound)
	level.ready.connect(_on_scenetree_ready)


func _on_scenetree_ready():
	# hack for ad reward
	if level.current_score != Vector2i.ZERO:
		_score_manager.score = level.current_score
		level.current_score = Vector2i.ZERO


func _on_double_bounced(side: int):
	match side:
		1:
			_score_manager.add_point(2)
		2:
			_score_manager.add_point(1)
	_play_point_sound()


func _play_point_sound():
	# if is not last point play sound
	if not _score_manager.score[0] == _score_manager.win_score \
			and not _score_manager.score[1] == _score_manager.win_score:
		point_sound.play()


func _play_game_over_sound(winner):
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
