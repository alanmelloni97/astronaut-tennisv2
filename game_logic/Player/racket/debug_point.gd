class_name DebugPoint
extends Node2D

var point_pos: Vector2


func _physics_process(delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	draw_circle(point_pos, 15, Color.GREEN)
