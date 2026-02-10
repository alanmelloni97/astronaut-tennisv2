extends Control
class_name PlayerSelect

@export var _player_texture: TextureRect
var characters: Array[CharacterResource]
var current_character_index: int


func _ready() -> void:
	_update_texture()


func _update_texture():
	_player_texture.texture = characters[current_character_index].character_texture


func _on_left_button_pressed() -> void:
	current_character_index -= 1
	_update_texture()


func _on_right_button_pressed() -> void:
	current_character_index += 1
	_update_texture()
