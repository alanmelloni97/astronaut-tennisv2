class_name BallSoundManager
extends Node

@export var audio_stream_player_2d: AudioStreamPlayer2D
@export var ball: Ball
@export var MAX_PITCH: float
@export var MIN_PITCH: float
@export var MAX_VOLUME_DB: float
@export var MIN_VOLUME_DB: float
@export var MAX_SPEED_DIFF: float


func _ready() -> void:
	ball.body_entered.connect(_on_body_entered)


func _on_body_entered(body: PhysicsBody2D):
	if body is not Racket:
		_set_audio_parameters()
		audio_stream_player_2d.play()
		print(body)


func _set_audio_parameters():
	var pitch: float = remap(ball.linear_velocity.length(), 0, MAX_SPEED_DIFF, MIN_PITCH, MAX_PITCH)
	var volume_db: float = remap(ball.linear_velocity.length(), 0, MAX_SPEED_DIFF, MIN_VOLUME_DB, MAX_VOLUME_DB)
	audio_stream_player_2d.pitch_scale = pitch
	audio_stream_player_2d.volume_db = volume_db
