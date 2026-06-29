extends CharacterBody3D
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D = $"../Player"
@onready var cyan_2: Marker3D = $"../Cyan2"
var start = false
var timer = 0.0
var block = false
func _physics_process(delta: float) -> void:
	var run = (global_position - player.global_position).normalized()
	if block:
		timer += delta
		if timer > 3:
			block = false
			timer = 0
		global_position = Vector3(-1,0,0)
	else:
		if !start :
			if Global.started:
				navigation_agent_3d.target_position = cyan_2.global_position 
				
		elif start and !Global.rage:
			timer += delta
			if timer > 0.5:
				navigation_agent_3d.target_position = player.global_position
				timer = 0
		if Global.rage :
			navigation_agent_3d.target_position = global_position + run
		var next = navigation_agent_3d.get_next_path_position()
		var vel = (next - global_transform.origin).normalized() * 4
		velocity = vel
	move_and_slide()


func _on_navigation_agent_3d_target_reached() -> void:
	start = true
