extends Node

# enables ads depending on features
@export var ads_poki: PackedScene
@export var ads_admob: PackedScene
@export var ads_game_pix: PackedScene
@export var gameplay_event_poki: PackedScene


func _ready() -> void:
	if OS.has_feature("poki"):
		add_child(ads_poki.instantiate())
		add_child(gameplay_event_poki.instantiate())
	if OS.has_feature("android"):
		add_child(ads_admob.instantiate())
	if OS.has_feature("gamepix"):
		add_child(ads_game_pix.instantiate())
		
