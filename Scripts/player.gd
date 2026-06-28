extends CharacterBody3D


const SPEED = 8
@onready var score: CSGMesh3D = $"../Tilemap/CSGMesh3D3"
@onready var moving: AudioStreamPlayer = $Moving
@onready var best: CSGMesh3D = $"../Tilemap/CSGMesh3D4"
@onready var turning: AudioStreamPlayer = $Turning
var move_left = false
var move_right = false
var move_up = false
var move_down = false
func _physics_process(delta: float) -> void:
	if score.mesh is TextMesh:
		score.mesh.text = str(Global.score)
	if best.mesh is TextMesh:
		best.mesh.text = str(Global.best)
	if Global.best < Global.score:
		Global.best = Global.score
	if Input.is_action_just_pressed("move_left"):
		move_left = true
		move_up = false
		move_down = false
		move_right = false
		velocity.z= 0
	if Input.is_action_just_pressed("move_right"):
		velocity.z = 0
		move_right = true
		move_left = false
		move_down = false
		move_up = false
	if Input.is_action_just_pressed("move_up"):
		velocity.x = 0
		move_up = true
		move_left = false
		move_right = false
		move_down = false
	if Input.is_action_just_pressed("move_down"):
		move_down = true
		move_left = false
		move_right = false
		move_up = false
		velocity.x = 0

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


func _on_checker_body_entered(body: Node3D) -> void:
	pass


func _on_checker_body_exited(body: Node3D) -> void:
	pass


func _on_checker_2_body_entered(body: Node3D) -> void:
	pass

func _on_checker_2_body_exited(body: Node3D) -> void:
	pass
