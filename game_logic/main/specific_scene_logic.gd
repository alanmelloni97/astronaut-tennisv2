class_name SpecificSceneLogic
extends Node

signal request_music_play
signal request_music_stop

# script that checks game specific things
@export var scene_manager: SceneManager

var two_players_mode: bool = false
var player_1_skin: CharacterSkin
var player_2_skin: CharacterSkin


func manage_before_changing_scene(current_scene: Node):
	# Check current scene data before changing
	if current_scene is MainMenu:
		two_players_mode = current_scene.two_players_requested
	elif current_scene is CharacterSelectionMenu:
		player_1_skin = current_scene.get_selected_skin_1()
		if two_players_mode:
			player_2_skin = current_scene.get_selected_skin_2()
			# rival for tournament is taken from Characters global so no need to save it here
		if current_scene.tournament_is_won:
			_restart_tournament()
	if current_scene is Level:
		request_music_play.emit()
		if not two_players_mode: # Tournament
			if current_scene.winner == 1: # Player 1 won
				# unlock skin if its new
				# search current rival skin on the Characters skins
				var rival_skin = _look_for_skin_in_globals(Characters.get_current_rival().skin.name)
				if not rival_skin.is_unlocked: # skin of rival is not unlocked
					rival_skin.is_unlocked = true
				# set character in the list as beated
				Characters.get_current_rival().beated = true
				scene_manager.save_requested.emit()


func manage_after_changing_scene(new_scene: Node):
	# Set up next scene
	if new_scene is CharacterSelectionMenu:
		new_scene.two_players = two_players_mode
	elif new_scene is Level:
		request_music_stop.emit()
		new_scene.player_1_skin = player_1_skin
		new_scene.two_player_mode = two_players_mode
		if two_players_mode:
			new_scene.player_2_skin = player_2_skin
		else:
			new_scene.rival = Characters.get_current_rival()


func _restart_tournament():
	for character in Characters.characters:
		character.beated = false


func _look_for_skin_in_globals(_name: String) -> CharacterSkin:
	for skin in Characters.skins:
		if skin.name == _name:
			return skin
	return null
