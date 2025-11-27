class_name Score
extends Node

@onready var panel: Panel = $Panel

@onready var score : int = 3
@onready var clock_node: Clock = $"../Timer"
@onready var health_node: Health = $"../../Player/Health"
@onready var checkpoint_node: Checkpoint = $"../../Checkpoint"
@onready var game_over_node: GameOverManager = $"../GameOverManager"
@onready var star_1: Sprite2D = $Panel/Star1
@onready var star_2: Sprite2D = $Panel/Star2
@onready var star_3: Sprite2D = $Panel/Star3

@export var level_name : String = "Level_0"

func _ready() -> void:
	get_tree().paused = false
	score = clampi(score, 0, 3)
	clock_node.time_out.connect(_decrease_score)
	health_node.health_low.connect(_decrease_score)
	checkpoint_node.checkpoint_activated.connect(_reveal_stars)
	game_over_node.player_lost.connect(_on_player_lost)
	
	panel.visible = false
	star_1.visible = false
	star_2.visible = false
	star_3.visible = false

# display stars in label when level is cleared
func _reveal_stars() -> void:
	GlobalData.mark_level_complete(level_name)
	GlobalData.update_level_score(level_name, score)
	var time_left = clock_node.get_time_remaining()
	GlobalData.update_level_time(level_name, time_left)

	panel.visible = true

	if score == 1:
		star_1.visible = true
		star_2.visible = false
		star_3.visible = false
	elif score == 2:
		star_1.visible = true
		star_2.visible = true
		star_3.visible = false
	elif score == 3:
		star_1.visible = true
		star_2.visible = true
		star_3.visible = true
	else:
		star_1.visible = false
		star_2.visible = false
		star_3.visible = false

	get_tree().paused = true

func _decrease_score() -> void:
	score -= 1

func _on_player_lost() -> void:
	score = 0

func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()

func _on_continue_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
