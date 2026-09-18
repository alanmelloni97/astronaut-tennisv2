class_name AdHandler
extends Node

signal watched_ad
signal rewarded_ad_failed

@export var main_ui: MainUI
@export var level: Level


func _ready() -> void:
	if not OS.has_feature("ads"):
		return
	main_ui.video_requested.connect(_on_video_requested)
	SignalBus.commercial_ended.connect(_on_interstitial_finished)
	SignalBus.rewarded_ad_ended.connect(_on_reward_break_finished)
	
	# Dont show ads if its the first time loading level
	if GameState.first_time_level:
		GameState.first_time_level = false
	else:
		# if the level has been reloaded from a rewarded ad, dont request interstitial
		# so that it doesnt show inmediately after rewarded ad
		if not level.current_score == Vector2i.ZERO:
			return
		_request_interstitial()
		
		
func _request_interstitial():
		get_tree().paused = true
		Utilities.mute_game(true)
		SignalBus.commercial_requested.emit()
	
		
func _on_video_requested():
	Utilities.mute_game(true)
	SignalBus.rewarded_ad_requested.emit()
	

func _on_interstitial_finished(_succeeded: bool):
	Utilities.mute_game(false)
	get_tree().paused = false



# WARNING: doesnt work, try testing on poki dev
func _on_reward_break_finished(succeeded: bool):
	Utilities.mute_game(false)
	print("Rewarded break done", succeeded)
	if succeeded:
		print("Reward gained!")
		watched_ad.emit()
	else:
		print("No Reward.")
		rewarded_ad_failed.emit()
	SignalBus.gameplay_started.emit()
