extends CanvasLayer

@export var _joystick_right: VirtualJoystick

var two_players: bool:
	set(x):
		two_players = x
		if not x:
			_joystick_right.queue_free()
