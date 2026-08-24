class_name Level
extends Node2D

@warning_ignore_start("unused_signal")
signal scene_requested(scene: PackedScene)

var two_player_mode: bool
var player_1_skin: CharacterSkin = Characters.skins[0]
var player_2_skin: CharacterSkin = Characters.skins[1]
var racket_1_skin: Texture2D = load("res://Assets/rackets/Racket blue.png")
var racket_2_skin: Texture2D = load("res://Assets/rackets/Racket red.png")
var rival: Character = Characters.characters[0]
var winner: int
# Hack to account for ad reward
var watched_ad: bool
var current_score: Vector2i
