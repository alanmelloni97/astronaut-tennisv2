class_name UIHandler
extends Node

@export var _level: Level
@export var _main_ui: MainUI


func _ready() -> void:
	_main_ui.game_paused.connect(_on_game_paused)
	_main_ui.game_unpaused.connect(_on_game_unpaused)
	_main_ui.game_quit.connect(_on_game_quit)
	_main_ui.game_ended.connect(_on_game_ended)
	_main_ui.retry_requested.connect(_on_retry_requested)


func _on_game_paused():
	get_tree().paused = true


func _on_game_unpaused():
	get_tree().paused = false


func _on_game_quit():
	_level.scene_requested.emit(Scenes.main_menu)


func _on_game_ended():
	if _level.two_player_mode:
		_level.scene_requested.emit(Scenes.main_menu)
	else: # tournament
		_level.scene_requested.emit(Scenes.character_selection)


func _on_retry_requested():
	_level.scene_requested.emit(Scenes.level)
