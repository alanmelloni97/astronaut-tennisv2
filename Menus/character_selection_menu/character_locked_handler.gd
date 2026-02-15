extends Node

@export var _player_1_select: PlayerSelect
@export var _player_2_select: PlayerSelect
@export var _start_button: Button
@export var _restart_tournament_button: Button


func _ready() -> void:
	_player_1_select.skin_updated.connect(update_start_button)
	_player_2_select.skin_updated.connect(update_start_button)
	check_new_tournament_button()


func check_new_tournament_button():
	if Characters.characters[-1].beated:
		_restart_tournament_button.show()


func update_start_button():
	# has to cover tournament case
	var can_play: bool = false
	if _player_1_select.get_current_skin().is_unlocked:
		can_play = true
	if _player_2_select and not _player_2_select.get_current_skin().is_unlocked:
		can_play = false
	if can_play:
		_start_button.disabled = false
	else:
		_start_button.disabled = true
