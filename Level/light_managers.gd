extends Node
class_name LightsManager


@export var light_1: Light2D
@export var light_2: Light2D


func update_lights(light_1_en: bool, light_2_en: bool):	
	light_1.enabled = light_1_en
	light_2.enabled = light_2_en
	
