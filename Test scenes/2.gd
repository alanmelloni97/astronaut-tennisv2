extends Sprite2D

var initial

func _ready() -> void:
	initial = position

func _physics_process(delta: float) -> void:
	global_position = $"..".global_position + initial
	global_rotation = 0
