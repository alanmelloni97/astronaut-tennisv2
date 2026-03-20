class_name Character
extends Resource

@export var name: String:
	set(x):
		name = x
@export var skin: CharacterSkin
@export var ai_level: AILevel:
	set(x):
		ai_level = x
@export_group("Save only")
@export var beated: bool = false # used in tournament
