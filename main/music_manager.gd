class_name MusicManager
extends Node

@export var audio_stream_player: AudioStreamPlayer
@export var FADE_IN_SECONDS: float
@export var FADE_OUT_SECONDS: float
@export var FADE_DB: int

var tween: Tween


func stop_music():
	tween = get_tree().create_tween()
	tween.tween_property(audio_stream_player, "volume_db", FADE_DB, FADE_OUT_SECONDS)


func play_music():
	tween = get_tree().create_tween()
	tween.tween_property(audio_stream_player, "volume_db", 0, FADE_IN_SECONDS)
