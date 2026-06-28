extends CSGBox3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is 


func _on_area_3d_body_entered(body: Node3D) -> void:
	if global_position.x == 14.5:
		body.global_position.x = -14
	elif global_position.x == -14.5:
		body.global_position.x = 14
