extends Node2D


func _ready() -> void:
	var a: BallEffect = ScaleBallEffect.new()
	var b = ScaleBallEffect.new()
	
	print(a.get_script())
	print(a.get_script().get_global_name())
	if b is ScaleBallEffect:
		pass
	if b.get_script() == a.get_script():
		print("aaaa")
	
	
