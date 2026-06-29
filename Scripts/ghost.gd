extends CharacterBody3D
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D = $"../Player"
var timer = 0.0
func _physics_process(delta: float) -> void:
	var next = navigation_agent_3d.get_next_path_position()
	var vel = (next - global_transform.origin).normalized() * 6
	velocity = vel
	timer += delta
	if timer > 0.5:
		navigation_agent_3d.target_position = player.global_position
		timer = 0
	move_and_slide()
