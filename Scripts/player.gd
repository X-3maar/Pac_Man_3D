extends CharacterBody3D
@onready var _04_pac_man_turning_the_corner_while_eating_the_pac_dots_1__audio_trimmer_com__2_2: AudioStreamPlayer = $"04_PacManTurningTheCornerWhileEatingThePacDots(1)[audioTrimmer_com](2)2"

@onready var color_rect: ColorRect = $"../CanvasLayer/ColorRect"
@onready var win: Node3D = $"../Win"
@onready var color_rect_2: ColorRect = $"../CanvasLayer/ColorRect2"
var count = 0
var SPEED = 6
@onready var score: CSGMesh3D = $"../NavigationRegion3D/Tilemap/CSGMesh3D3"
@onready var best: CSGMesh3D = $"../NavigationRegion3D/Tilemap/CSGMesh3D4"
var move_left = false
@onready var pink: CharacterBody3D = $"../Pink"
@onready var cyan: CharacterBody3D = $"../Cyan"
@onready var orange: CharacterBody3D = $"../Orange"
@onready var red: CharacterBody3D = $"../Red"
var move_right = false
var move_up = false
var move_down = false
var paused = false
var timer = 0

func _physics_process(delta: float) -> void:
	if Global.lost:
		_04_pac_man_turning_the_corner_while_eating_the_pac_dots_1__audio_trimmer_com__2_2.stop()
		color_rect_2.show()
	if count == 262:
		win.process_mode = PROCESS_MODE_INHERIT
		win.show()
		_04_pac_man_turning_the_corner_while_eating_the_pac_dots_1__audio_trimmer_com__2_2.stop()
		if red:
			red.queue_free()
		if cyan:
			cyan.queue_free()
		if orange:
			orange.queue_free()
		if pink:
			pink.queue_free()
		
	if Global.rage == true:
		timer += delta
		SPEED = 8
		if timer > 7:
			Global.rage = false
			SPEED = 6
			timer = 0
	
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
		_04_pac_man_turning_the_corner_while_eating_the_pac_dots_1__audio_trimmer_com__2_2.stop()
	elif Input.is_action_just_pressed("esc") and paused:
		Engine.time_scale = 1.0
		color_rect.hide()
		paused = false
		if win.process_mode != win.PROCESS_MODE_INHERIT:
			_04_pac_man_turning_the_corner_while_eating_the_pac_dots_1__audio_trimmer_com__2_2.play()
	move_and_slide()


func _on_button_pressed() -> void:
	Engine.time_scale = 1.0
	color_rect.hide()
	


func _on_button_3_pressed() -> void:
	Engine.time_scale = 1.0
	Global.score = 0
	Global.started = false
	Global.lost = false
	get_tree().reload_current_scene()

func _on_button_2_pressed() -> void:
	Engine.time_scale = 1.0
	Global.lost = false
	Global.score = 0
	Global.started = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
