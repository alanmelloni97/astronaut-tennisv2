extends Node
class_name AdsAdmob

var interstitial_ad: InterstitialAd
var interstitial_loader := InterstitialAdLoader.new()

func _ready() -> void:
	SignalBus.commercial_requested.connect(_show_interstitial)
	#SignalBus.rewarded_ad_requested.connect(_show_rewarded)
	# Initialize Admob
	var listener := OnInitializationCompleteListener.new()
	# when initialized, call ad load, for some reason the plugin uses this instead of signals
	listener.on_initialization_complete = func(_status: InitializationStatus) -> void:
		_loads_ads()
	MobileAds.initialize(listener)
	
func _loads_ads():
	_load_interstitial()
	#_laod_rewarded()

func _load_interstitial() -> void:
	var ad_unit_id := "ca-app-pub-3940256099942544/1033173712" # Test ID
	var callback := InterstitialAdLoadCallback.new()
	
	callback.on_ad_loaded = func(ad: InterstitialAd) -> void:
		interstitial_ad = ad
		print("Interstitial loaded. Ready to show.")
		_setup_interstitial_callbacks()
		
	callback.on_ad_failed_to_load = func(error: LoadAdError) -> void:
		print("Interstitial failed to load: ", error.message)
		
	interstitial_loader.load(ad_unit_id, AdRequest.new(), callback)

func _setup_interstitial_callbacks() -> void:
	if not interstitial_ad:
		return
	var callbacks := FullScreenContentCallback.new()
	callbacks.on_ad_showed_full_screen_content = func() -> void:
		print("Interstitial showed.")
	callbacks.on_ad_dismissed_full_screen_content = func() -> void:
		print("Interstitial dismissed.")
		interstitial_ad.destroy()
		interstitial_ad = null
		SignalBus.commercial_ended.emit(true)
		_load_interstitial()
	callbacks.on_ad_failed_to_show_full_screen_content = func(error: AdError) -> void:
		print("Interstitial failed to show: ", error.message)
		interstitial_ad.destroy()
		interstitial_ad = null
		SignalBus.commercial_ended.emit(false)
		_load_interstitial()
	interstitial_ad.full_screen_content_callback = callbacks

func _show_interstitial() -> void:
	if interstitial_ad:
		interstitial_ad.show()
	else:
		print("Interstitial not loaded yet.")
		SignalBus.commercial_ended.emit(false)
