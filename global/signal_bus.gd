extends Node
# Autoload: SignalBus

@warning_ignore_start("unused_signal")
# Game Events
signal gameplay_started
signal gameplay_stopped

# Ads
signal commercial_requested
signal commercial_ended(succeeded: bool)
signal rewarded_ad_requested
signal rewarded_ad_ended(succeeded: bool)
