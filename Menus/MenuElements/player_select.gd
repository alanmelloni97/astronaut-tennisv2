class_name PlayerSelect
extends Control

@export var _player_texture: TextureRect

var characters: Array[Character]
var current_character_index: int:
	set(x):
		if x > characters.size() - 1 or x < -(characters.size() - 1):
			current_character_index = 0
		else:
			current_character_index = x


func get_current_character() -> Character:
	return characters[current_character_index]


func update_texture():
	_player_texture.texture = get_current_character().image


func _on_left_button_pressed() -> void:
	current_character_index -= 1
	update_texture()


func _on_right_button_pressed() -> void:
	current_character_index += 1
	update_texture()
