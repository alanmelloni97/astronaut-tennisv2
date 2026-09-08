extends Node
class_name AchievementsManager

enum Achievement{
	FIRST_POINT,
	FIRST_WIN,
	USE_BAR,
	WIN_7_1,
	WIN_7_0,
	WIN_GAME
}
signal achieved(achievement: String)

@export var achievements: Dictionary[Achievement, bool]

	
func set_achievement(achievement: Achievement):
	if not achievements.has(achievement):
		print("This achievement does not exist locally: %s" % achievement)
		return
	if achievements[achievement] == false:
		print("already achieved: ", achievement)
		return
	achievements[achievement] = true
	# convert enum to string and send it in signal
	achieved.emit(achievements.keys()[achievement])
	print(achievements.keys()[achievement])
