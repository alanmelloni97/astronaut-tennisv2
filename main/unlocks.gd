class_name UnlocksManager
extends Node

var skins: Array[CharacterSkin]


func _ready() -> void:
	skins = _get_skins()
