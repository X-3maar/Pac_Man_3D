extends Area3D





func _on_body_entered(body: Node3D) -> void:
	Global.rage = true
	Global.score += 100
	Global.count += 1
	queue_free()
