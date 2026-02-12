class_name CharacterSelectionMenu
extends CanvasLayer

signal scene_requested(scene: PackedScene)

@export var player_1_select: PlayerSelect
@export var player_2_select: PlayerSelect
@export var _tournament_table: TournamentTable
@export var _start_button: Button

var two_players: bool
var tournament_is_won: bool = false


func _ready() -> void:
	player_1_select.characters = Characters.characters
	player_2_select.characters = Characters.characters
	player_1_select.update_character()
	player_2_select.update_character()

	set_mode()
	if tournament_is_won:
		_start_button.text = "NEW TOURNAMENT"


func set_mode():
	if two_players:
		_tournament_table.queue_free()
	else:
		player_2_select.queue_free()


func get_selected_character_1() -> Character:
	return player_1_select.get_current_character()


func get_selected_character_2() -> Character:
	if player_2_select:
		return player_2_select.get_current_character()
	else:
		return Characters.get_current_rival()


func _on_back_button_pressed() -> void:
	scene_requested.emit(Scenes.main_menu)


func _on_start_button_pressed() -> void:
	scene_requested.emit(Scenes.level)
