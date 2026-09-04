extends Node

func _ready() -> void:
	if process_mode == PROCESS_MODE_DISABLED:
		return
	print("gamepixloaded")
	SignalBus.commercial_requested.connect(_on_commercial_requested)
	SignalBus.rewarded_ad_requested.connect(_on_rewarded_ad_requested)


func _on_commercial_requested():
	GPX.interstitialAd(Callable(self, "onInterstitialComplete"))
	print("inter")
	
func _on_rewarded_ad_requested():
	GPX.rewardAd(Callable(self, "onRewardSuccess"), Callable(self, "onRewardFail"))
	print("reawrd")
		
func onInterstitialComplete():
	SignalBus.commercial_ended.emit()
	print("Intersitital AD completed")
	
func onRewardSuccess():
	SignalBus.rewarded_ad_ended.emit(true)
	print("Reward AD succeed")
		
func onRewardFail():
	SignalBus.rewarded_ad_ended.emit(false)
	print("Reward AD failed")

func _input(ev):
	if ev is InputEventKey and ev.keycode == KEY_I and not(ev.is_pressed()):
		print("Interstitial AD started")
		GPX.interstitialAd(onInterstitialComplete)
	if ev is InputEventKey and ev.keycode == KEY_R and not(ev.is_pressed()):
		print("Reward AD started")
		GPX.rewardAd(Callable(self, "onRewardSuccess"), Callable(self, "onRewardFail"))
