class_name SaveSystem
extends Node

@export var specific_static_save: SpecificStaticSave

var _save_path: NodePath = "res://save_system/save_game.tres"


func save_game():
	var game_save: GameSave = GameSave.new()
	specific_static_save.save_static(game_save)
	ResourceSaver.save(game_save, _save_path)


func load_game():
	var game_save: GameSave = ResourceLoader.load(_save_path)
	specific_static_save.load_static(game_save)
