extends Node

@export var score_manager: ScoreManager
@export var level: Level


func _ready() -> void:
	score_manager.score_changed.connect(_on_score_changed)
	score_manager.game_finished.connect(_on_game_finished)
	_check_carbon_rod()
	
func _on_score_changed(score: Vector2i):
	if score.x == 1:
		SignalBus.scored.emit(1)

func _on_game_finished(winner: int):
	if level.two_player_mode:
		return
	if winner == 1:
		SignalBus.game_won.emit(score_manager.score)
		if level.rival == Characters.characters.back():	# if last character (laika)
			SignalBus.last_game_won.emit()
		

func _check_carbon_rod():
	if level.racket_1_skin == load("res://Assets/rackets/carbon rod.png"):
		SignalBus.bar_used.emit()
