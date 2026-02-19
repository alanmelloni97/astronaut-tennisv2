extends Node

@export var racket: Racket
@export var audio_stream_player_2d: AudioStreamPlayer2D
@export var MAX_PITCH: float
@export var MIN_PITCH: float
@export var MAX_VOLUME_DB: float
@export var MIN_VOLUME_DB: float
@export var MAX_SPEED_DIFF: float


func _ready() -> void:
	racket.body_entered.connect(_on_body_entered)


func _on_body_entered(body: PhysicsBody2D):
	if body is Ball:
		_set_audio_parameters(body)
		audio_stream_player_2d.play()


func _set_audio_parameters(body: Ball):
	var velocity_diff: float = (body.linear_velocity - racket.linear_velocity).length()
	var velocity_sum: float = body.linear_velocity.length() + racket.linear_velocity.length()
	var pitch: float = remap(velocity_diff, 0, MAX_SPEED_DIFF, MIN_PITCH, MAX_PITCH)
	var volume_db: float = remap(velocity_sum, 0, MAX_SPEED_DIFF, MIN_VOLUME_DB, MAX_VOLUME_DB)
	audio_stream_player_2d.pitch_scale = pitch
	audio_stream_player_2d.volume_db = volume_db
