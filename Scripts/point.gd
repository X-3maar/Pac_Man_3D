extends Area3D


func _on_body_entered(body: Node3D) -> void:
	Global.score += 50
	Global.count += 1
	queue_free()
