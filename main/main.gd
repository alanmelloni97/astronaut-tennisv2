class_name Main
extends Node

@export var save_system: SaveSystem
@export var scene_manager: SceneManager
@export var specific_scene_logic: SpecificSceneLogic
@export var music_manager: MusicManager


func _ready() -> void:
	scene_manager.save_requested.connect(save_system.save_game)
	specific_scene_logic.request_music_play.connect(music_manager.play_music)
	specific_scene_logic.request_music_stop.connect(music_manager.stop_music)
	main()


func main():
	# Start game
	save_system.load_game()
	scene_manager._change_to_scene(Scenes.main_menu)
