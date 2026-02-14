class_name PlayerSelect
extends Control

signal skin_updated()

@export var _player_texture: TextureRect
@export var suit_name: Label
@export var lock_texture: TextureRect

var skins: Array[CharacterSkin]
var current_skin_selectable: bool:
	set = set_current_skin_selectable
var current_skin_index: int:
	set(x):
		if x > skins.size() - 1 or x < -(skins.size() - 1):
			current_skin_index = 0
		else:
			current_skin_index = x


func get_current_skin() -> CharacterSkin:
	return skins[current_skin_index]


func set_current_skin_selectable(selectable: bool):
	if selectable:
		_player_texture.modulate = Color.WHITE
		suit_name.modulate = Color.WHITE
		lock_texture.hide()
	else:
		_player_texture.modulate = Color.DIM_GRAY
		suit_name.modulate = Color.DIM_GRAY
		lock_texture.show()


func update_skin():
	_player_texture.texture = get_current_skin().image
	suit_name.text = get_current_skin().name
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
