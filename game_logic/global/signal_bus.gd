extends Node
# Autoload: SignalBus

@warning_ignore_start("unused_signal")
# Game Events
signal gameplay_started
signal gameplay_stopped
signal main_loaded

# Ads
signal commercial_requested
signal commercial_ended(succeeded: bool)
signal rewarded_ad_requested
signal rewarded_ad_ended(succeeded: bool)

# Review for android and ios
signal review_requested

# Achievements
signal scored(player: int)
signal game_won(score: Vector2)
signal last_game_won
signal bar_used
