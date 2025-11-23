extends Node2D

@onready var isSpace = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent):
	if event.is_action_pressed("space") and isSpace:
		print("clicked2")
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	if event.is_action_pressed("space"):
		print("clicked")
		isSpace = true

func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
