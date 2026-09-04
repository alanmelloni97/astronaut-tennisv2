extends Node
class_name GameStartTracker

func _ready() -> void:
	if process_mode == PROCESS_MODE_DISABLED:
		return
	SignalBus.gameplay_started.connect(_on_gameplay_start)
	SignalBus.gameplay_stopped.connect(_on_gameplay_stop)
	
func _on_gameplay_start():
	PokiSDK.gameplayStart()
	
func _on_gameplay_stop():
	PokiSDK.gameplayStop()
