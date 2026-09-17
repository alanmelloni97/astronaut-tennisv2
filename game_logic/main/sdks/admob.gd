extends Node
class_name AdsAdmob

var _interstitial_ad : InterstitialAd
var _full_screen_content_callback := FullScreenContentCallback.new()
var first_load: bool = true

func _ready() -> void:
	SignalBus.commercial_requested.connect(_on_show_pressed)
	# Initialize Admob
	var listener := OnInitializationCompleteListener.new()
	# when initialized, call ad load, for some reason the plugin uses this instead of signals
	listener.on_initialization_complete = func(status: InitializationStatus) -> void:
		_on_load_pressed()
	MobileAds.initialize(listener)


func _on_load_pressed():
	#free memory
	if _interstitial_ad:
		#always call this method on all AdFormats to free memory on Android/iOS
		_interstitial_ad.destroy()
		_interstitial_ad = null

	var unit_id : String
	if OS.get_name() == "Android":
		unit_id = "ca-app-pub-3940256099942544/1033173712"
	elif OS.get_name() == "iOS":
		unit_id = "ca-app-pub-3940256099942544/4411468910"

	var interstitial_ad_load_callback := InterstitialAdLoadCallback.new()
	interstitial_ad_load_callback.on_ad_failed_to_load = func(adError : LoadAdError) -> void:
		print(adError.message)

	interstitial_ad_load_callback.on_ad_loaded = func(interstitial_ad : InterstitialAd) -> void:
		print("interstitial ad loaded " + str(interstitial_ad._uid))
		_interstitial_ad = interstitial_ad
		_interstitial_ad.full_screen_content_callback = _full_screen_content_callback

	InterstitialAdLoader.new().load(unit_id, AdRequest.new(), interstitial_ad_load_callback)

func _on_show_pressed():
	if _interstitial_ad:
		_interstitial_ad.show()
		_on_load_pressed()
