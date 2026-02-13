class_name PlayerSelect
extends Control

signal skin_updated()

@export var _player_texture: TextureRect

var skins: Array[CharacterSkin]
var current_skin_selectable: bool:
	set(x):
		if x:
			_player_texture.modulate = Color.WHITE
		else:
			_player_texture.modulate = Color.DIM_GRAY
var current_skin_index: int:
	set(x):
		if x > skins.size() - 1 or x < -(skins.size() - 1):
			current_skin_index = 0
		else:
			current_skin_index = x


func get_current_skin() -> CharacterSkin:
	return skins[current_skin_index]


func update_skin():
	_player_texture.texture = get_current_skin().image
	if not get_current_skin().is_unlocked:
		current_skin_selectable = false
	else:
		current_skin_selectable = true
	skin_updated.emit()


func _on_left_button_pressed() -> void:
	current_skin_index -= 1
	update_skin()


func _on_right_button_pressed() -> void:
	current_skin_index += 1
	update_skin()
