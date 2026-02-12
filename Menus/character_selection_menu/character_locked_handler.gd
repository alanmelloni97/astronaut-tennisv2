extends Node

@export var _player_1_select: PlayerSelect
@export var _player_2_select: PlayerSelect
@export var _start_button: Button


func _ready() -> void:
	_player_1_select.character_updated.connect(update_start_button)
	_player_2_select.character_updated.connect(update_start_button)


func update_start_button():
	if _player_1_select.get_current_character().skin.is_unlocked and \
	_player_2_select.get_current_character().skin.is_unlocked:
		_start_button.disabled = false
	else:
		_start_button.disabled = true
