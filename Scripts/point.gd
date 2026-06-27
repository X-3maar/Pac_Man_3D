extends Area3D


func _on_body_entered(body: Node3D) -> void:
	Global.score += 50
	queue_free()
