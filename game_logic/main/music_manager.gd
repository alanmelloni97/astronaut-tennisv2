class_name MusicManager
extends Node

@export var audio_stream_player: AudioStreamPlayer
@export var FADE_IN_SECONDS: float
@export var FADE_OUT_SECONDS: float
@export var FADE_DB: int


func stop_music():
	var tween: Tween
	tween = get_tree().create_tween()
	tween.tween_property(audio_stream_player, "volume_db", FADE_DB, FADE_OUT_SECONDS).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)


func play_music():
	var tween: Tween
	tween = get_tree().create_tween()
	tween.tween_property(audio_stream_player, "volume_db", 0, FADE_IN_SECONDS).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
