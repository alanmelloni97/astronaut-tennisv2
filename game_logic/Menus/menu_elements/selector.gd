class_name Selector
extends Control

signal skin_updated()

@export var texture_rect: TextureRect
@export var skins: Array[Texture2D]

var tween: Tween
var current_skin_index: int:
	set(x):
		# account for over/underflow of the array
		if x > skins.size() - 1 or x < -(skins.size() - 1):
			current_skin_index = 0
		else:
			current_skin_index = x


func _ready() -> void:
	update_skin()
	_poki_remove_bar()


func get_current_skin() -> Texture2D:
	return skins[current_skin_index]


func update_skin():
	texture_rect.texture = get_current_skin()
	skin_updated.emit()

	if tween:
		tween.kill()
	texture_rect.modulate = Color.WHITE # if tween was killed in the middle of animation restore original modulate
	tween = create_tween()
	tween.tween_property(texture_rect, "modulate", texture_rect.modulate, 0.5).from(
		Color.TRANSPARENT
	)


func _poki_remove_bar():
	skins.pop_back()


func _on_left_button_pressed() -> void:
	current_skin_index -= 1
	update_skin()


func _on_right_button_pressed() -> void:
	current_skin_index += 1
	update_skin()
