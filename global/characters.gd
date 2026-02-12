extends Node

@export var characters: Array[Character]
@export var skins: Array[CharacterSkin]


func _ready() -> void:
	# Get skins from chracters. this is only used before any saves, after skins will be overriden by loader
	for character in Characters.characters:
		if character.skin not in skins:
			skins.append(character.skin)
