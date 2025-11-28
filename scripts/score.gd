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
@onready var tow_bucks: Label = $"Panel/Tow-Bucks"

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
	
	await get_tree().create_timer(1.5).timeout

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
	
	if level_name == "Level_0" and (GlobalData.is_level_complete("Level_0")):
		GlobalData.tow_bucks += 5
		tow_bucks.text = "5"
	if level_name == "Level_1" and (GlobalData.is_level_complete("Level_1")):
		GlobalData.tow_bucks += 10
		tow_bucks.text = "10"
	if level_name == "Level_2" and (GlobalData.is_level_complete("Level_2")):
		GlobalData.tow_bucks += 15
		tow_bucks.text = "15"
	if level_name == "Level_3" and (GlobalData.is_level_complete("Level_3")):
		GlobalData.tow_bucks += 20
		tow_bucks.text = "20"
	if level_name == "Level_4" and (GlobalData.is_level_complete("Level_4")):
		GlobalData.tow_bucks += 25
		tow_bucks.text = "25"
	if level_name == "Level_5" and (GlobalData.is_level_complete("Level_5")):
		GlobalData.tow_bucks += 30
		tow_bucks.text = "30"

	GlobalData.save_game_data()
	get_tree().paused = true

func _decrease_score() -> void:
	score -= 1

func _on_player_lost() -> void:
	score = 0

func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()

func _on_continue_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
