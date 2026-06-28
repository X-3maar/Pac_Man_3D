extends CharacterBody3D


const SPEED = 8
@onready var moving: AudioStreamPlayer = $Moving
@onready var turning: AudioStreamPlayer = $Turning
var move_left = false
var move_right = false
var move_up = false
var move_down = false
@onready var camera_3d: Camera3D = $Camera3D
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		move_left = true
		move_up = false
		move_down = false
		move_right = false
		velocity.z= 0
		turning.play()
	if Input.is_action_just_pressed("move_right"):
		velocity.z = 0
		move_right = true
		move_left = false
		move_down = false
		move_up = false
		moving.stop()
		turning.play()
		await turning.finished
		moving.play()
	if Input.is_action_just_pressed("move_up"):
		velocity.x = 0
		move_up = true
		move_left = false
		move_right = false
		move_down = false
		moving.stop()
		turning.play()
		await turning.finished
		moving.play()
	if Input.is_action_just_pressed("move_down"):
		move_down = true
		move_left = false
		move_right = false
		move_up = false
		velocity.x = 0
		moving.stop()
		turning.play()
		await turning.finished
		moving.play()

	if move_down:
		velocity.z = SPEED
		rotation.y = rotate_toward(rotation.y,deg_to_rad(0),20)
	if move_up :
		velocity.z = -SPEED
		rotation.y = rotate_toward(rotation.y,deg_to_rad(180),20)
	if move_left:
		velocity.x = -SPEED 
		rotation.y = rotate_toward(rotation.y,deg_to_rad(-90),20)
	if move_right:
		velocity.x = SPEED 
		rotation.y = rotate_toward(rotation.y,deg_to_rad(90), 20)
	move_and_slide()
