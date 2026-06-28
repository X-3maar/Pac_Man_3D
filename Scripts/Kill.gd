extends Area3D



func _on_body_entered(body: Node3D) -> void:
	Global.count = 0
	Engine.time_scale = 0.0
	
