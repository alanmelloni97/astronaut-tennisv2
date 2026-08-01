class_name TournamentNameSpot
extends Label

@export var beated_color: Color
@export var current_color: Color
@export var unbeated_color: Color


func set_character(character: Character) -> void:
	text = "·" + character.name
	if not character.beated:
		if character == Characters.get_current_rival():
			modulate = current_color
			tween_color()
		else:
			modulate = unbeated_color
	else:
		modulate = beated_color


func tween_color():
	var tween: Tween = create_tween().set_loops().set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "modulate", current_color * Color(0.737, 0.737, 0.737, 1.0), 0.3)
	tween.tween_property(self, "modulate", current_color, 0.3)
