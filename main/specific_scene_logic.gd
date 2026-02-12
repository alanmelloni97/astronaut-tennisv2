class_name SpecificSceneLogic
extends Node

# script that checks game specific things
@export var scene_manager: SceneManager

var two_players_mode: bool = false
var player_1_character: Character
var player_2_character: Character


func manage_before_changing_scene(current_scene: Node):
	# Check current scene data before changing
	if current_scene is MainMenu:
		two_players_mode = current_scene.two_players_requested
	elif current_scene is CharacterSelectionMenu:
		player_1_character = current_scene.get_selected_character_1()
		player_2_character = current_scene.get_selected_character_2()


func manage_after_changing_scene(new_scene: Node):
	# Set up next scene
	if new_scene is CharacterSelectionMenu:
		new_scene.two_players = two_players_mode
	elif new_scene is Level:
		new_scene.player_1_character = player_1_character
		new_scene.player_2_character = player_2_character
		new_scene.two_player_mode = two_players_mode
