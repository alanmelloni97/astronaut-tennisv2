class_name BallSpawnerManager
extends Node

@export var ball: Ball
@export var animation_player: AnimationPlayer

var aux_gravity: float


func _ready() -> void:
	ball.ready.connect(_spawn_animation)
	animation_player.animation_finished.connect(_on_animation_finished)


func _spawn_animation():
	ball.collision_shape.disabled = true
	aux_gravity = ball.gravity_scale
	ball.gravity_scale = 0.0
	animation_player.play("spawn")


func _on_animation_finished(_anim_name: StringName):
	ball.collision_shape.disabled = false
	ball.gravity_scale = aux_gravity
	ball.anim_finished.emit()
