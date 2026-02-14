class_name PointDetector
extends Node2D

signal ball_double_bounced(player: int)
signal ball_bounced(player: int)

enum BallState {
	NO_BOUNCE,
	LEFT_BOUNCE,
	RIGHT_BOUNCE,
}

@export var left_detector: Area2D
@export var right_detector: Area2D

var ball_state: BallState = BallState.NO_BOUNCE


func _ready() -> void:
	left_detector.body_entered.connect(_on_detector_entered.bind(left_detector))
	right_detector.body_entered.connect(_on_detector_entered.bind(right_detector))


func _on_detector_entered(_body: PhysicsBody2D, detector: Area2D):
	match detector:
		left_detector:
			ball_bounced.emit(1)
			match ball_state:
				BallState.NO_BOUNCE:
					ball_state = BallState.LEFT_BOUNCE
				BallState.RIGHT_BOUNCE:
					ball_state = BallState.NO_BOUNCE
				BallState.LEFT_BOUNCE:
					ball_state = BallState.NO_BOUNCE
					ball_double_bounced.emit(1)
		right_detector:
			ball_bounced.emit(2)
			match ball_state:
				BallState.NO_BOUNCE:
					ball_state = BallState.RIGHT_BOUNCE
				BallState.RIGHT_BOUNCE:
					ball_state = BallState.NO_BOUNCE
					ball_double_bounced.emit(2)
				BallState.LEFT_BOUNCE:
					ball_state = BallState.NO_BOUNCE
