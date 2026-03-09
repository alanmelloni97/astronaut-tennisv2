class_name PauseMenu
extends Control

signal unpaused
signal quit_game


func _on_continue_button_pressed() -> void:
	unpaused.emit()


func _on_quit_button_pressed() -> void:
	quit_game.emit()
