class_name RacketAIManager
extends Node2D

#Node2D to debug draw
@export var ai_actor: Node2D

var input_axis: Vector2
var target: Node2D
var ray_amount: int = 8
var ray_array: Array[Vector2] = []
var interest_array: Array[float] = []
var danger_array: Array[float] = []


func _ready() -> void:
	ray_array.resize(ray_amount)
	interest_array.resize(ray_amount)
	danger_array.resize(ray_amount)
	for i in ray_amount:
		var angle = i * 2 * PI / ray_amount
		ray_array[i] = Vector2.RIGHT.rotated(angle)


func _physics_process(_delta: float) -> void:
	if target != null:
		_get_steering()
		queue_redraw()


func _draw():
	for ray in interest_array:
		if ray != null:
			draw_line(ai_actor.global_position, ai_actor.global_position + choose_direction() * 2, Color.GREEN)


func set_interest():
	for i in ray_amount:
		var d = ray_array[i].dot(ray_array[i].direction_to(target.global_position))
		interest_array[i] = max(0, d) #ignore negative values


func set_danger():
	for i in ray_amount:
		danger_array[i] = 0


func choose_direction() -> Vector2:
	for i in ray_amount:
		if danger_array[i] > 0.0:
			interest_array[i] = 0

	var chosen_dir = Vector2.ZERO
	for i in ray_amount:
		chosen_dir += ray_array[i] * interest_array[i]
	if target != null:
		print(interest_array)
		print(chosen_dir.normalized())
	return chosen_dir.normalized()


func _get_steering():
	set_interest()
	set_danger()
	#var dir: Vector2 = choose_direction()
