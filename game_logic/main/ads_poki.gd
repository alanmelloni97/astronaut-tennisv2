extends Node
class_name AdsPoki

func _ready() -> void:
	if process_mode == PROCESS_MODE_DISABLED:
		return
	print("pokiloaded")
	SignalBus.commercial_requested.connect(_on_commercial_requested)
	SignalBus.rewarded_ad_requested.connect(_on_rewarded_ad_requested)
	PokiSDK.commercial_break_done.connect(_on_commercial_done.unbind(1))
	PokiSDK.commercial_break_failed.connect(_on_commercial_done.unbind(1))
	PokiSDK.rewarded_break_done.connect(_on_rewarded_ad_done)
	PokiSDK.rewarded_break_failed.connect(_on_rewarded_ad_done.unbind(1).bind(false))	# unbind error param and bind failed ad


func _on_commercial_requested():
	PokiSDK.commercialBreak()
	
func _on_rewarded_ad_requested():
	PokiSDK.rewardedBreak()
		
func _on_commercial_done():
	SignalBus.commercial_ended.emit()
	
func _on_rewarded_ad_done(response):
	if response:
		SignalBus.rewarded_ad_ended.emit(true)
	else:
		SignalBus.rewarded_ad_ended.emit(false)
