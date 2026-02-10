class_name InputManager
extends Node

var vector_1: Array[StringName] = ["move_left_1", "move_right_1", "move_up_1", "move_down_1"]
var vector_2: Array[StringName] = ["move_left_2", "move_right_2", "move_up_2", "move_down_2"]
var player_vector: Array[StringName] = vector_1
var input_axis: Vector2


func _physics_process(_delta: float) -> void:
	input_axis = Input.get_vector(player_vector[0], player_vector[1], player_vector[2], player_vector[3])


func set_player(player_number):
	match player_number:
		1:
			player_vector = vector_1
		2:
			player_vector = vector_2
