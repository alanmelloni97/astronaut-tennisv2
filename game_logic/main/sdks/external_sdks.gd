extends Node

# All sdks are disabled by default, enable required and call start() method on them (similar to _ready)

@export var steam_achievements: SteamAchievements
@export var steam_initializer: Node
@export var ads_admob: AdsAdmob
@export var ads_poki: AdsPoki
@export var gameplay_events_poki: GameplayEventsPoki

func _ready() -> void:
	if OS.has_feature("android"):
		_activate_sdk(ads_admob)
	elif OS.has_feature("poki"):
		_activate_sdk(ads_poki)
		_activate_sdk(gameplay_events_poki)
	elif OS.has_feature("steam") or (OS.is_debug_build() and OS.has_feature("pc")):
		_activate_sdk(steam_initializer)
		_activate_sdk(steam_achievements)

func _activate_sdk(sdk: Node):
	sdk.process_mode = Node.PROCESS_MODE_INHERIT
	if sdk.has_method("start"):
		sdk.start()
	else:
		printerr("sdk doesnt have start() implemented")
