class_name Level
extends Node2D

@warning_ignore_start("unused_signal")
signal scene_requested(scene: PackedScene)

var two_player_mode: bool
var player_1_skin: CharacterSkin
var player_2_skin: CharacterSkin
var racket_1_skin: Texture2D
var racket_2_skin: Texture2D
var rival: Character
var winner: int
