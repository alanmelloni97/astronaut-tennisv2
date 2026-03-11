class_name Character
extends Resource

@export var name: String:
	set(x):
		name = x
		print("name")
@export var skin: CharacterSkin
@export var beated: bool = false # used in tournament
@export var ai_level: AILevel:
	set(x):
		ai_level = x
		print("ailevel")
