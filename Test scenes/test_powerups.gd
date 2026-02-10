extends Node2D


func _ready() -> void:
	var effect = ScaleBallEffect.new()
	print(effect is ScaleBallEffect)
	print(effect is BallEffect)
	print(effect is BounceBallEffect)
	print(typeof(effect))
	print(effect.get_class())
	print(effect.is_class("BallEffect"))
	
