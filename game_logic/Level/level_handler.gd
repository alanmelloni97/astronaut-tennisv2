class_name LevelHandler
extends Node

@export var touch_joysticks: TouchJoysticks
@export var _score_manager: ScoreManager
@export var _player_1: Player
@export var _player_2: Player
@export var _main_ui: MainUI
@export var _level: Level


func _ready() -> void:
	_score_manager.game_finished.connect(_on_game_finished)
	set_up_players()
	touch_joysticks.two_players = _level.two_player_mode
	CrazyGames.Game.gameplay_start()


func set_up_players():
	# account for laika
	_player_1.set_up_player(
		Player.PlayerType.PLAYER_1,
		_level.player_1_skin,
		_level.racket_1_skin,
		null,
	)
	if _level.two_player_mode:
		_player_2.set_up_player(
			Player.PlayerType.PLAYER_2,
			_level.player_2_skin,
			_level.racket_2_skin,
			null,
		)
	else:
		_player_2.set_up_player(
			Player.PlayerType.AI_RIVAL,
			_level.rival.skin,
			_level.racket_2_skin,
			_level.rival.ai_level,
		)


func _on_game_finished(winner: int):
	_level.winner = winner
	_player_1.disable_input()
	_player_2.disable_input()
	_main_ui.show_game_over_menu(winner, _level.two_player_mode)
