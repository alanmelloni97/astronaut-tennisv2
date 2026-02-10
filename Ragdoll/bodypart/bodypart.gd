extends RigidBody2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Sprite2D
@export var pinjoint: RigidBody2D


func _ready():
	set_collision_shape_from_sprite(collision_shape_2d, sprite_2d)


func set_collision_shape_from_sprite(col_shape: CollisionShape2D, sprite: Sprite2D):
	if col_shape.shape == null:
		col_shape.shape = RectangleShape2D.new()
		if sprite.texture != null:
			col_shape.shape.size = sprite.texture.get_size() * sprite.scale
			col_shape.position = sprite_2d.position
			col_shape.rotation = sprite_2d.rotation
		#pass
