extends CanvasLayer
class_name TournamentMenu

signal start_game_pressed(character_1: CharacterResource)
signal back_to_main_menu_pressed

@export var _player_select: PlayerSelect
@export var _tournament_table: TournamentTable
@export var _start_button: Button
var tournament_is_won: bool = false
var tournament_table: Array[String]

func _ready() -> void:
	_tournament_table.set_tournament_table(tournament_table)
	if tournament_is_won:
		_start_button.text = "NEW TOURNAMENT"



func _on_back_button_pressed() -> void:
	back_to_main_menu_pressed.emit()


func _on_start_button_pressed() -> void:
	start_game_pressed.emit(_player_select.characters[_player_select.current_character_index])
