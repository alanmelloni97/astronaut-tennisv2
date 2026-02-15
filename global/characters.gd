extends Node

# Characters should be put in order of the tourament: characters[0] will be the first opponent
@export var characters: Array[Character]
@export var skins: Array[CharacterSkin]


func _ready() -> void:
	# Get skins from characters. this is only used before any saves, after skins will be overriden by loader
	for character in Characters.characters:
		if character.skin != null and character.skin not in skins:
			skins.append(character.skin)
	# now the skins resources are linked to the ones saved on //res. I have to make them unique
	skins = skins.duplicate_deep() #make skins have unique resources
	print(skins[0])


func get_current_rival() -> Character:
	for c in characters:
		if not c.beated:
			return c
	return characters[-1] # means tournament has been won
