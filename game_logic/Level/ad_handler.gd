class_name AdHandler
extends Node

signal watched_ad
signal rewarded_ad_failed

@export var main_ui: MainUI


func _ready() -> void:
	if OS.has_feature("poki"):
		get_tree().paused = true
	main_ui.video_requested.connect(_on_video_requested)
	SignalBus.commercial_ended.connect(_on_commercial_break_finished)
	SignalBus.rewarded_ad_ended.connect(_on_reward_break_done)
	Utilities.mute_game(true)
	if GameState.first_time_level:
		GameState.first_time_level = false
	else:
		SignalBus.commercial_requested.emit()


func _on_commercial_break_finished():
	Utilities.mute_game(false)
	get_tree().paused = false


func _on_video_requested():
	Utilities.mute_game(true)
	SignalBus.commercial_requested.emit()
	

# WARNING: doesnt work, try testing on poki dev
func _on_reward_break_done(succeeded: bool):
	Utilities.mute_game(false)
	print("Rewarded break done", succeeded)
	if succeeded:
		print("Reward gained!")
		watched_ad.emit()
	else:
		print("No Reward.")
		rewarded_ad_failed.emit()
	SignalBus.gameplay_started.emit()
