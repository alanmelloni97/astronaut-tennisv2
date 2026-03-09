class_name Level
extends Node2D

@warning_ignore_start("unused_signal")
signal scene_requested(scene: PackedScene)

var two_player_mode: bool
var player_1_skin: CharacterSkin
var player_2_skin: CharacterSkin
var rival: Character
var winner: int
