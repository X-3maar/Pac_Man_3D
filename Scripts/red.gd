extends CharacterBody3D
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D = $"../Player"
@onready var red_2: Marker3D = $"../Red2"
var start = false
var timer = 0.0
func _physics_process(delta: float) -> void:
	if !start:
		if Global.started:
			navigation_agent_3d.target_position = red_2.global_position 

	elif start:
		timer += delta
		if timer > 0.5:
			navigation_agent_3d.target_position = player.global_position
			timer = 0
		
	var next = navigation_agent_3d.get_next_path_position()
	var vel = (next - global_transform.origin).normalized() * 4
	velocity = vel
	
	move_and_slide()


func _on_navigation_agent_3d_target_reached() -> void:
	start = true
