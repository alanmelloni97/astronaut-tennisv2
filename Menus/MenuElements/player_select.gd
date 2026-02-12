class_name PlayerSelect
extends Control

signal character_updated()

@export var _player_texture: TextureRect

var characters: Array[Character]
var current_character_selectable: bool:
	set(x):
		if x:
			_player_texture.modulate = Color.WHITE
		else:
			_player_texture.modulate = Color.DIM_GRAY
var current_character_index: int:
	set(x):
		if x > characters.size() - 1 or x < -(characters.size() - 1):
			current_character_index = 0
		else:
			current_character_index = x


func get_current_character() -> Character:
	return characters[current_character_index]


func update_character():
	_player_texture.texture = get_current_character().image
	if not get_current_character().skin.is_unlocked:
		current_character_selectable = false
	else:
		current_character_selectable = true
	character_updated.emit()


func _on_left_button_pressed() -> void:
	current_character_index -= 1
	update_character()


func _on_right_button_pressed() -> void:
	current_character_index += 1
	update_character()
