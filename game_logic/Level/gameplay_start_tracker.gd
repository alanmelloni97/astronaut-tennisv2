class_name GameplayStartTracker
extends Node

@export var main_ui: MainUI
@export var player_1: Player
@export var player_2: Player
@export var level: Level
@export var score_manager: ScoreManager

# tracks when gameplay starts and pauses to send signal to web sdks (poki, crazygames, etc.)
var started: bool = false


func _ready() -> void:
	main_ui.game_paused.connect(_on_gameplay_stopped)
	main_ui.game_unpaused.connect(_on_gameplay_start)
	score_manager.game_finished.connect(_on_gameplay_stopped.unbind(1))


func _unhandled_input(_event: InputEvent) -> void:
	if player_1.racket.movement_handler._input_manager.input_axis != Vector2.ZERO or \
			(
				level.two_player_mode
				and player_2.racket.movement_handler._input_manager.input_axis != Vector2.ZERO
			):
		if not started:
			started = true
			PokiSDK.gameplayStart()
			print("gameplay started")


func _on_gameplay_stopped():
	PokiSDK.gameplayStop()
	print("gameplay stopped")


func _on_gameplay_start():
	await get_tree().process_frame
	await get_tree().process_frame
	PokiSDK.gameplayStart()
	print("gameplay started")
