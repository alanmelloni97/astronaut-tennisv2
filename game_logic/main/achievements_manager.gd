extends Node
class_name AchievementsManager

# Achievements must have same name in steam, google play and here

signal achieved(achievement: String)

enum Achievement{
	FIRST_POINT,
	FIRST_WIN,
	USE_BAR,
	WIN_7_1,
	WIN_7_0,
	WIN_GAME
}

var achievements: Dictionary[String, bool]

func _ready() -> void:
	for key in Achievement.keys():
		achievements[key] = false

func set_achievement(achievement: String):
	if not achievements.has(achievement):
		print("This achievement does not exist locally: %s" % achievement)
		return
	if achievements[achievement] == true:
		print("already achieved: ", achievement)
		return
	achievements[achievement] = true
	# convert enum to string and send it in signal
	print("achieved: ", achievement)
	achieved.emit(achievement)
