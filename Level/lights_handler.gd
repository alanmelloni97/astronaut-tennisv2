class_name LightsHandler
extends Node

@export var _lights_manager: LightsManager
@export var bounce_detector: BounceDetector


func _ready() -> void:
	bounce_detector.ball_bounced.connect(_on_ball_bounced)
	bounce_detector.ball_double_bounced.connect(_on_ball_double_bounced)
	bounce_detector.reset_bounce.connect(_on_reset_bounce)


func _on_ball_bounced(side: int):
	match side:
		1:
			_lights_manager.update_lights(true, false)
		2:
			_lights_manager.update_lights(false, true)


func _on_ball_double_bounced(_side: int):
	_lights_manager.update_lights(false, false)


func _on_reset_bounce():
	_lights_manager.update_lights(false, false)
