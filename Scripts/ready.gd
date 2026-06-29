extends CSGMesh3D
@onready var start: AudioStreamPlayer = $"../Start"
@onready var _04_pac_man_turning_the_corner_while_eating_the_pac_dots_1__audio_trimmer_com__2_2: AudioStreamPlayer = $"../Player/04_PacManTurningTheCornerWhileEatingThePacDots(1)[audioTrimmer_com](2)2"

var timer = 0.0
func _ready() -> void:
	get_tree().paused = true
	start.play()
func _process(delta: float) -> void:
	var del = get_process_delta_time()
	timer += del
	if timer > 4:
		get_tree().paused = false
		Global.started = true
		_04_pac_man_turning_the_corner_while_eating_the_pac_dots_1__audio_trimmer_com__2_2.play()
		queue_free()
		
	
