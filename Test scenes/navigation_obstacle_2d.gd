class_name TESTIndependentTransform
extends Node2D

# only share position with parent, not rotation. Useful to ahve child of rigidbody but
# without it sollowing its rotation
@export var parent: Node2D


func _ready() -> void:
	top_level = true


func _physics_process(_delta: float) -> void:
	global_position = parent.global_position
