extends Node
class_name AchievementsTracker

# reacts to global signals and decides when to unlock achievement. Whether it
# has been achieved before or not is checked by achievementsManager
@export var ach_man: AchievementsManager

func _ready() -> void:
	SignalBus.game_won.connect(_on_game_won)
	SignalBus.last_game_won.connect(_on_last_game_won)
	SignalBus.scored.connect(_on_scored)
	SignalBus.bar_used.connect(_on_bar_used)


func _set_achievement(ach: AchievementsManager.Achievement):
	# convert achievement to string and call achivement manager method
	ach_man.set_achievement(AchievementsManager.Achievement.keys()[ach])
	

func _on_game_won(score: Vector2i):
	_set_achievement(AchievementsManager.Achievement.FIRST_WIN)
	if score == Vector2i(7,1):
		_set_achievement(AchievementsManager.Achievement.WIN_7_1)
	elif score == Vector2i(7, 0):
		_set_achievement(AchievementsManager.Achievement.WIN_7_0)



func _on_scored(player: int):
	if player == 1:
		_set_achievement(AchievementsManager.Achievement.FIRST_POINT)

func _on_last_game_won():
	_set_achievement(AchievementsManager.Achievement.WIN_GAME)
	
	
func _on_bar_used():
	_set_achievement(AchievementsManager.Achievement.USE_BAR)
	
