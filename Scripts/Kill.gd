extends Area3D


@onready var death_0: AudioStreamPlayer = $"../../Death0"
@onready var eat_ghost: AudioStreamPlayer = $"../../EatGhost"

func _on_body_entered(body: Node3D) -> void:
	if !Global.rage:
		Engine.time_scale = 0.0
		Global.lost = true
		Global.started = false
		death_0.play()
	else:
		eat_ghost.play()
		var parent = get_parent()
		parent.global_position = Vector3.ZERO
		parent.block = true
		Global.score += 100
