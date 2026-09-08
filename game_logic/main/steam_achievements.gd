extends Node
class_name SteamAchievements

@export var achievements_tracker: AchievementsManager

func _ready() -> void:
	achievements_tracker.achieved.connect(_steam_set_achievement)


func _steam_set_achievement(this_achievement: String) -> void:
	if not Steam.setAchievement(this_achievement):
		print("Failed to set achievement: %s" % this_achievement)
		return
	print("Set acheivement: %s" % this_achievement)
	_store_steam_data()

func _store_steam_data() -> void:
	if not Steam.storeStats():
		print("Failed to store data on Steam, should be stored locally")
		return
	print("Data successfully sent to Steam")
