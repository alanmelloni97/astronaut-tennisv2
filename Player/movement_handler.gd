class_name MovementHandler
extends Node

@export var _input_manager: InputManager
@export var _motion_manager: MotionManager
@export var _ai_manager: RacketAIManager


func _physics_process(_delta: float) -> void:
	var input: Vector2
	if _ai_manager:
		input = _ai_manager.input_axis
	else:
		input = _input_manager.input_axis
	_motion_manager.move_body(input)


func set_player_type(type: Player.PlayerType):
	match type:
		Player.PlayerType.PLAYER_1:
			_ai_manager.queue_free()
			_input_manager.set_player(1)
		Player.PlayerType.PLAYER_2:
			_ai_manager.queue_free()
			_input_manager.set_player(2)
		Player.PlayerType.AI_RIVAL:
			_input_manager.queue_free()


func disable_input():
	_motion_manager.queue_free()
