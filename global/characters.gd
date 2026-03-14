extends Node

# Characters should be put in order of the tourament: characters[0] will be the first opponent
@export var characters: Array[Character]
@export var skins: Array[CharacterSkin]


func _ready() -> void:
	# now the skins resources are linked to the ones saved on //res. I have to make them unique
	skins = skins.duplicate_deep() #make skins have unique resources


func get_current_rival() -> Character:
	for c in characters:
		if not c.beated:
			return c
	return characters[-1] # means tournament has been won
