extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect



func _on_button_pressed() -> void:
	color_rect.show()
	animation_player.play("play")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
