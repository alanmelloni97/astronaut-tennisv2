extends Node

@export var powerups: Array[PowerUpData]
@export var power_up_sc: PackedScene
@export var collision_shape_2d: CollisionShape2D
@export var MIN_TIME_BETWEEN_SPAWNS: int
@export var MAX_TIME_BETWEEN_SPAWNS: int
@export var timer: Timer

var rectangle: RectangleShape2D


func _ready() -> void:
	rectangle = collision_shape_2d.shape
	timer.timeout.connect(_on_timer_timeout)
	timer.start(randf_range(MIN_TIME_BETWEEN_SPAWNS, MAX_TIME_BETWEEN_SPAWNS))


# for when a collision shape with a rectangleshape2d is used to define a rectangle in editor
func get_random_point_in_rectangle_shape(rectangle_shape: RectangleShape2D):
	var x = randf_range(-rectangle_shape.size.x / 2, rectangle_shape.size.x / 2)
	var y = randf_range(-rectangle_shape.size.y / 2, rectangle_shape.size.y / 2)
	return Vector2(x, y)


func spawn():
	var spawn_point: Vector2 = collision_shape_2d.global_position + get_random_point_in_rectangle_shape(rectangle)
	var powerup_data: PowerUpData = powerups.pick_random()
	var powerup: BallPowerUp = power_up_sc.instantiate()
	powerup.global_position = spawn_point
	powerup.power_up_data = powerup_data
	get_tree().root.add_child(powerup)
	print(get_tree().root)


func _on_timer_timeout():
	spawn()
	timer.wait_time = randf_range(MIN_TIME_BETWEEN_SPAWNS, MAX_TIME_BETWEEN_SPAWNS)
