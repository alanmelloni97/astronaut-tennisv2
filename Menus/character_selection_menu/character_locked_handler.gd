extends Node

@export var _player_1_select: PlayerSelect
@export var _player_2_select: PlayerSelect
@export var _start_button: Button


func _ready() -> void:
	_player_1_select.skin_updated.connect(update_start_button)
	_player_2_select.skin_updated.connect(update_start_button)


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
