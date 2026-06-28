extends CharacterBody3D


const SPEED = 8
@onready var moving: AudioStreamPlayer = $Moving
@onready var turning: AudioStreamPlayer = $Turning
var move_left = false
var move_right = false
var move_up = false
var move_down = false
var can_down = true
var can_left = true
var can_up = true
var can_right = true
func _physics_process(delta: float) -> void:


	if Input.is_action_just_pressed("move_left") and !move_right:
		move_left = true
		move_up = false
		move_down = false
		move_right = false
		velocity.z= 0
	if Input.is_action_just_pressed("move_right") and !move_left:
		velocity.z = 0
		move_right = true
		move_left = false
		move_down = false
		move_up = false
	if Input.is_action_just_pressed("move_up") and !move_down:
		velocity.x = 0
		move_up = true
		move_left = false
		move_right = false
		move_down = false
	if Input.is_action_just_pressed("move_down") and !move_up:
		move_down = true
		move_left = false
		move_right = false
		move_up = false
		velocity.x = 0
	if Input.is_action_just_released("move_left"):
		move_left = false
	if Input.is_action_just_released("move_right"):
		move_right = false
	if Input.is_action_just_released("move_up"):
		move_up = false
	if Input.is_action_just_released("move_down"):
		move_down = false
	if move_down:
		move_up = false
	if move_up:
		move_down = false
	if move_left:
		move_right = false
	if move_right:
		move_left = false
	if move_down and !move_up and can_down:
		velocity.z = SPEED
		can_right = true
		can_left = true
		can_up = false
	if move_up and !move_down and can_up:
		velocity.z = -SPEED
		can_right = true
		can_left = true
		can_down = false
	if move_left and !move_right and can_left:
		velocity.x = -SPEED 
		can_right = false
		can_up = true
		can_down = true
	if move_right and !move_left and can_right:
		velocity.x = SPEED 
		can_left = false
		can_up = true
		can_down = true
	move_and_slide()
