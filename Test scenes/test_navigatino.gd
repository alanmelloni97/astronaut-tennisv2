extends Node2D


func _physics_process(delta: float) -> void:
	if Engine.get_physics_frames() % 10 == 0:
		if not $NavigationRegion2D.is_baking():
			$NavigationRegion2D.bake_navigation_polygon()
