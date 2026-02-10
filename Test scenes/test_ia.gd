extends Node2D


@onready var racket: Racket = $Racket

@onready var area_2d: Area2D = $Area2D



func  _ready() -> void:
	racket.set_player_type(Racket.PlayerType.AI_RIVAL)
	racket.set_ball_detection_area(area_2d)
