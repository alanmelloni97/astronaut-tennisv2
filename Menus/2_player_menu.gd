extends CanvasLayer
class_name TwoPlayerMenu

signal started_game(player_1: CharacterResource, player_2: CharacterResource)
signal back_to_main_menu()

@export var _player_select_1: PlayerSelect
@export var _player_select_2: PlayerSelect



func _on_start_button_pressed() -> void:
	started_game.emit(
		_player_select_1.characters[_player_select_1.current_character_index],
		_player_select_2.characters[_player_select_2.current_character_index]
		)


func _on_back_button_pressed() -> void:
	back_to_main_menu.emit()
