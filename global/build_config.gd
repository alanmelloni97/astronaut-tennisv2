extends Node
## Autoload: BuildConfig

enum Difficulty {
	REALISTIC,
	CASUAL,
}

var difficulty: Difficulty = Difficulty.REALISTIC


func _ready() -> void:
	if DisplayServer.is_touchscreen_available() or OS.has_feature("web_casual"):
		difficulty = Difficulty.CASUAL
