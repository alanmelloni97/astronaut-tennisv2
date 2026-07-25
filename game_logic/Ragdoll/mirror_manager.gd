class_name MirrorManager
extends Node

@export var dog_ragdoll: Ragdoll


func mirror_dog() -> void:
	for child in dog_ragdoll.find_children("*", "Node2D"):
		if child is Node2D:
			child.position.x *= -1
			if child is Sprite2D:
				var c = child as Sprite2D # if not, no autocomplete
				c.flip_h = not c.flip_h
