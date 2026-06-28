extends CharacterBody3D

@onready var color_rect: ColorRect = $"../CanvasLayer/ColorRect"
@onready var win: Node3D = $"../Win"

const SPEED = 8
@onready var score: CSGMesh3D = $"../Tilemap/CSGMesh3D3"
@onready var best: CSGMesh3D = $"../Tilemap/CSGMesh3D4"
var move_left = false
var move_right = false
var move_up = false
var move_down = false
var paused = false

func _physics_process(delta: float) -> void:
	if Global.count == 262:
		win.process_mode = PROCESS_MODE_INHERIT
		win.show()
		
	if score.mesh is TextMesh:
		score.mesh.text = str(Global.score)
	if best.mesh is TextMesh:
		best.mesh.text = str(Global.best)
	if Global.best < Global.score:
		Global.best = Global.score
	if Input.is_action_just_pressed("move_left") and !test_move(global_transform,Vector3.LEFT) :
		move_left = true
		move_up = false
		move_down = false
		move_right = false
		velocity.z= 0
	if Input.is_action_just_pressed("move_right") and !test_move(global_transform,Vector3.RIGHT):
		velocity.z = 0
		move_right = true
		move_left = false
		move_down = false
		move_up = false
	if Input.is_action_just_pressed("move_up") and !test_move(global_transform,Vector3.FORWARD):
		velocity.x = 0
		move_up = true
		move_left = false
		move_right = false
		move_down = false
	if Input.is_action_just_pressed("move_down") and !test_move(global_transform,Vector3.BACK):
		move_down = true
		move_left = false
		move_right = false
		move_up = false
		velocity.x = 0

	if move_down:
		velocity.z = SPEED
		rotation.y = rotate_toward(rotation.y,deg_to_rad(0),20)
	elif move_up:
		velocity.z = -SPEED
		rotation.y = rotate_toward(rotation.y,deg_to_rad(180),20)
	elif move_left:
		velocity.x = -SPEED 
		rotation.y = rotate_toward(rotation.y,deg_to_rad(-90),20)
	elif move_right:
		velocity.x = SPEED 
		rotation.y = rotate_toward(rotation.y,deg_to_rad(90), 20)
	if Input.is_action_just_pressed("esc") and !paused:
		Engine.time_scale = 0.0
		color_rect.show()
		paused = true
	elif Input.is_action_just_pressed("esc") and paused:
		Engine.time_scale = 1.0
		color_rect.hide()
		paused = false
	
	move_and_slide()


func _on_button_pressed() -> void:
	Engine.time_scale = 1.0
	color_rect.hide()
	


func _on_button_3_pressed() -> void:
	Engine.time_scale = 1.0
	Global.score = 0
	Global.started = false
	get_tree().reload_current_scene()

func _on_button_2_pressed() -> void:
	Engine.time_scale = 1.0
	Global.score = 0
	Global.count = 0
	Global.started = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
