class_name PlayerSelect
extends Control

signal skin_updated()

@export var suit_name: Label
@export var lock_control: Control
@export var racket_select: Selector
@export var _player_texture: TextureRect

var tween: Tween
var skins: Array[CharacterSkin]
var current_skin_selectable: bool:
	set = set_current_skin_selectable
var current_skin_index: int:
	set(x):
		# account for over/underflow of the array
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
		lock_control.hide()
	else:
		_player_texture.modulate = Color(0.307, 0.307, 0.307)
		suit_name.modulate = Color(0.307, 0.307, 0.307)
		lock_control.show()


func update_skin():
	_player_texture.texture = get_current_skin().image
	suit_name.text = get_current_skin().name
	if not get_current_skin().is_unlocked:
		current_skin_selectable = false
	else:
		current_skin_selectable = true
	skin_updated.emit()

	if tween:
		tween.kill()
	if get_current_skin().is_unlocked:
		tween = get_tree().create_tween()
		tween.tween_property(_player_texture, "modulate", _player_texture.modulate, 0.5).from(
			Color.TRANSPARENT
		)


func _on_left_button_pressed() -> void:
	current_skin_index -= 1
	update_skin()


func _on_right_button_pressed() -> void:
	current_skin_index += 1
	update_skin()
