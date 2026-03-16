class_name TouchJoysticks
extends CanvasLayer

@export var _joystick_right: VirtualJoystick
@export var _joystick_left: VirtualJoystick

var two_players: bool:
	set(x):
		if x:
			_joystick_left.two_players = true
			_joystick_right.two_players = true
		else:
			_joystick_right.queue_free()
