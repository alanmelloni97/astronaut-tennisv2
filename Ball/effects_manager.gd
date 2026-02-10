extends Node
class_name EffectsManager

@export var _ball: Ball


func change_scale(new_scale):
	_ball.scale = new_scale
	
	
func change_gravity(new_gravity):
	_ball.gravity_scale = new_gravity
