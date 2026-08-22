class_name ScoreUI
extends Control

@export var label_score_1: Label
@export var label_score_2: Label
@export var score_manager: ScoreManager
@export var level: Level


func _ready() -> void:
	score_manager.score_changed.connect(update_score)
	level.ready.connect(_on_scenetree_ready)


#
#func _process(_delta: float) -> void:
#update_score(score_manager.score)
func update_score(score: Vector2i):
	label_score_1.text = str(score[0])
	label_score_2.text = str(score[1])


func _on_scenetree_ready():
	update_score(score_manager.score)
