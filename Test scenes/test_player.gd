extends Node2D

@onready var player: Player = $Player


func _ready() -> void:
	player.set_up_player(Racket.PlayerType.PLAYER_1, SkinResource.new(), Area2D.new())
