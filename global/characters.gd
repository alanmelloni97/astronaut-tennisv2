extends Node

# Characters should be put in order of the tourament: characters[0] will be the first opponent
@export var characters: Array[Character]
@export var skins: Array[CharacterSkin]


func _ready() -> void:
	# Get skins from chracters. this is only used before any saves, after skins will be overriden by loader
	for character in Characters.characters:
		if character.skin not in skins:
			skins.append(character.skin)


func get_current_rival():
	for c in characters:
		if not c.beated:
			return c
	return null # means tournament has been won
