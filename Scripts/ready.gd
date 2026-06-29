extends CSGMesh3D

var timer = 0.0
func _ready() -> void:
	get_tree().paused = true
func _process(delta: float) -> void:
	var del = get_process_delta_time()
	timer += del
	if timer > 2:
		get_tree().paused = false
		queue_free()
		
	
