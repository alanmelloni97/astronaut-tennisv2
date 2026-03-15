extends Node

@onready var ball: Ball = $Ball


func _ready() -> void:
	ball.remove()
