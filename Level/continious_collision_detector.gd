class_name ContiniousCollisionDetector
extends Area2D

signal continuous_collision_detected

var counter := 0


# detect if ball is stuck due to entering collision shape but never exiting it
func _physics_process(_delta: float) -> void:
	if _detect_continuos_collision():
		continuous_collision_detected.emit()


func _detect_continuos_collision() -> bool:
	if not get_overlapping_bodies().is_empty():
		counter += 1
	else:
		counter = 0

	if counter > 100:
		counter = 0
		return true
	return false
