extends Node

# enables ads depending on features
@export var ads_poki: AdsPoki
@export var ads_admob: Node
@export var ads_game_pix: Node
@export var gameplay_event_poki: GameStartTracker


func _ready() -> void:
	if OS.has_feature("poki"):
		ads_poki.process_mode = Node.PROCESS_MODE_INHERIT
		gameplay_event_poki.process_mode = Node.PROCESS_MODE_INHERIT
	if OS.has_feature("android"):
		ads_admob.process_mode = Node.PROCESS_MODE_INHERIT
	if OS.has_feature("gamepix"):
		ads_game_pix.process_mode = Node.PROCESS_MODE_INHERIT
