extends Area3D

@onready var red: CharacterBody3D = $"../../../Red"



func _on_body_entered(body: Node3D) -> void:
	Global.rage = false
	Global.rage = true
	Global.score += 100
	Global.count += 1
	queue_free()
