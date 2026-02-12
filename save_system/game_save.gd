class_name GameSave
extends Resource

# The savefile that will be stored. it should have all data from all entities
@export var skins: Array[CharacterSkin]
@export var characters: Array[Character] # only to save the beated property
