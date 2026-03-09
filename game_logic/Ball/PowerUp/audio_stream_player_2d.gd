class_name AutoFreeAudioStreamPlayer
extends AudioStreamPlayer2D


func _ready() -> void:
	finished.connect(queue_free)
