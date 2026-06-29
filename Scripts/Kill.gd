extends Area3D



func _on_body_entered(body: Node3D) -> void:
	if !Global.rage:
		Engine.time_scale = 0.0
		Global.lost = true
		Global.started = false
	else:
		var parent = get_parent()
		parent.global_position = Vector3.ZERO
		parent.block = true
		Global.score += 100
