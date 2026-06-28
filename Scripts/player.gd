extends CharacterBody3D


const SPEED = 8.0
@onready var moving: AudioStreamPlayer = $Moving
@onready var turning: AudioStreamPlayer = $Turning


func _physics_process(delta: float) -> void:

	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if Input.is_action_just_pressed("move_left"):
		position.x -= direction.x * SPEED
	if Input.is_action_just_pressed("move_right"):
		position.x += direction.x * SPEED
	if Input.is_action_just_pressed("move_up"):
		position.z += direction.z * SPEED
	if Input.is_action_just_pressed("move_down"):
		position.z -= direction.z * SPEED
	move_and_slide()
