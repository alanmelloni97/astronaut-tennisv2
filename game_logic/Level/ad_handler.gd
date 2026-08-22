class_name AdHandler
extends Node

signal watched_ad
signal rewarded_ad_failed

@export var main_ui: MainUI


func _ready() -> void:
	main_ui.video_requested.connect(_on_video_requested)
	if OS.has_feature("poki"):
		PokiSDK.commercial_break_done.connect(_on_commercial_break_finished)
		PokiSDK.commercial_break_failed.connect(_on_commercial_break_finished)
		PokiSDK.rewarded_break_done.connect(_on_reward_break_done)

		get_tree().paused = true
		Utilities.mute_game(true)
		PokiSDK.commercialBreak()
		print("comercial start")


func _on_commercial_break_finished(_response):
	print("comercial finished")
	Utilities.mute_game(false)
	get_tree().paused = false


func _on_video_requested():
	Utilities.mute_game(true)
	PokiSDK.rewardedBreak()


func _on_reward_break_done(response):
	Utilities.mute_game(false)
	print("Rewarded break done", response)
	if response:
		print("Reward gained!")
		watched_ad.emit()
	else:
		print("No Reward.")
		rewarded_ad_failed.emit()
	PokiSDK.gameplayStart()
