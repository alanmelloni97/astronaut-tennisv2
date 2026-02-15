class_name SaveSystem
extends Node

@export var specific_static_save: SpecificStaticSave

var _save_path: NodePath


func _ready() -> void:
	if OS.has_feature("debug"): # If running on editor or debug build
		_save_path = "res://save_system/save_game.tres"
	else: # if release build
		_save_path = "user://save_game.tres"


func save_game():
	var game_save: GameSave = GameSave.new()
	specific_static_save.save_static(game_save)
	ResourceSaver.save(game_save, _save_path)


func load_game():
	if ResourceLoader.exists(_save_path):
		var game_save: GameSave = ResourceLoader.load(_save_path)
		specific_static_save.load_static(game_save)
