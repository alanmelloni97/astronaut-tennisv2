extends Node


func _ready() -> void:
	await CrazyGames.is_initialised_async()
	print("crazygames ready")
