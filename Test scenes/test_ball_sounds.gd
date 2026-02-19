extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Racket/MovementHandler.set_player_type(Player.PlayerType.PLAYER_1)
