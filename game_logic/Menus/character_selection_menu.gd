class_name CharacterSelectionMenu
extends CanvasLayer

signal scene_requested(scene: PackedScene)

@export var player_1_select: PlayerSelect
@export var player_2_select: PlayerSelect
@export var _tournament_table: TournamentTable

var two_players: bool
var tournament_is_won: bool = false


func _ready() -> void:
	player_1_select.skins = Characters.skins
	player_2_select.skins = Characters.skins
	player_1_select.update_skin()
	player_2_select.update_skin()

	set_mode()


func set_mode():
	if two_players:
		_tournament_table.queue_free()
	else:
		player_2_select.queue_free()


func get_selected_skin_1() -> CharacterSkin:
	return player_1_select.get_current_skin()


func get_selected_skin_2() -> CharacterSkin:
	return player_2_select.get_current_skin()


func _on_back_button_pressed() -> void:
	scene_requested.emit(Scenes.main_menu)


func _on_start_button_pressed() -> void:
	scene_requested.emit(Scenes.level)


func _on_new_tournament_button_pressed() -> void:
	tournament_is_won = true
	scene_requested.emit(Scenes.level)
