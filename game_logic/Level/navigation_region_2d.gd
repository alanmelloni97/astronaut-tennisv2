extends NavigationRegion2D


func _physics_process(_delta: float) -> void:
	if Engine.get_physics_frames() % 10 == 0:
		if not is_baking():
			bake_navigation_polygon()
