extends Node
## Autoload: BuildConfig

enum Difficulty {
	REALISTIC,
	TOUCHSCREEN,
	CASUAL,
}

var difficulty: Difficulty = Difficulty.REALISTIC


func _ready() -> void:
	if DisplayServer.is_touchscreen_available():
		difficulty = Difficulty.TOUCHSCREEN
	elif OS.has_feature("casual"):
		difficulty = Difficulty.CASUAL
