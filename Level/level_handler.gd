class_name LevelHandler
extends Node

@export var _score_manager: ScoreManager
@export var _player_1: Player
@export var _player_2: Player
@export var _main_UI: MainUI
@export var _ball_ai_detector: Area2D
@export var _level: Level

var player_amount: int = 1


func _ready() -> void:
	_score_manager.game_finished.connect(_on_game_finished)
	_main_UI.game_paused.connect(_on_game_paused)
	_main_UI.game_unpaused.connect(_on_game_unpaused)
	_main_UI.game_quit.connect(_on_game_quit)
	_player_1.set_up_player(Racket.PlayerType.PLAYER_1, ResourceLoader.load("res://Ragdoll/skin/skins/skin_astronaut_default.tres"), null)
	#this info should come from pre game menu

	_player_2.set_up_player(Racket.PlayerType.PLAYER_2, ResourceLoader.load("res://Ragdoll/skin/skins/skin_astronaut_default.tres"), _ball_ai_detector)


func _on_game_finished(winner: int):
	_player_1.disable_input()
	_player_2.disable_input()
	_main_UI.show_game_over_menu(winner, player_amount)


func _on_game_paused():
	get_tree().paused = true


func _on_game_unpaused():
	get_tree().paused = false


func _on_game_quit():
	_level.scene_requested.emit(Scenes.main_menu)
