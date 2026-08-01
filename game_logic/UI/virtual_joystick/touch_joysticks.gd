class_name TouchJoysticks
extends CanvasLayer

@export var _joystick_left: VirtualJoystickAddon
@export var _joystick_right: VirtualJoystickAddon

var two_players: bool:
	set(x):
		if not x:
			_joystick_right.queue_free()
			# get joystick left to occupy all the viewport
			_joystick_left.set_anchors_preset(Control.PRESET_FULL_RECT, true)
