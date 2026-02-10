extends Sprite2D



func _physics_process(delta: float) -> void:
	position += Vector2(40,0) * delta
	rotation += 3 * delta
