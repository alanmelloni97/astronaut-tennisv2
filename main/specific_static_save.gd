class_name SpecificStaticSave
extends Node


# Static data specific to the game
func save_static(game_save: GameSave):
	game_save.characters = Characters.characters
	game_save.skins = Characters.skins


func load_static(game_save: GameSave):
	Characters.characters = game_save.characters
	Characters.skins = game_save.skins
