class_name LightsManager
extends Node

@export var light_1: Sprite2D
@export var light_2: Sprite2D


func update_lights(light_1_en: bool, light_2_en: bool):
	light_1.visible = light_1_en
	light_2.visible = light_2_en
