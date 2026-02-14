class_name LightsHandler
extends Node

@export var _lights_manager: LightsManager
@export var point_detectors: PointDetector


func _ready() -> void:
	point_detectors.ball_bounced.connect(_on_ball_bounced)
	point_detectors.ball_double_bounced.connect(_on_ball_double_bounced)


func _on_ball_bounced(side: int):
	match side:
		1:
			_lights_manager.update_lights(true, false)
		2:
			_lights_manager.update_lights(false, true)


func _on_ball_double_bounced(_side: int):
	_lights_manager.update_lights(false, false)
