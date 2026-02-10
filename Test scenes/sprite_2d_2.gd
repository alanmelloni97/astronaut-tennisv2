extends Sprite2D


func _physics_process(delta: float) -> void:
	position = $"../..".position.rotated($"../..".rotation )
	#rotation += $"../..".rotation
