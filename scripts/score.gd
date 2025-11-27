class_name Score
extends Node

@onready var score : int = 3
@onready var clock_node: Clock = $"../Timer"
@onready var health_node: Health = $"../../Player/Health"
@onready var checkpoint_node: Checkpoint = $"../../Checkpoint"
@onready var game_over_node: GameOverManager = $"../GameOverManager"

@export var level_name : String = "Level_0"

func _ready() -> void:
	score = clampi(score, 0, 3)
	clock_node.time_out.connect(_decrease_score)
	health_node.health_low.connect(_decrease_score)
	checkpoint_node.checkpoint_activated.connect(_reveal_stars)
	game_over_node.player_lost.connect(_on_player_lost)

# display stars in label when level is cleared
func _reveal_stars() -> void:
	GlobalData.mark_level_complete(level_name)
	GlobalData.update_level_score(level_name, score)
	var time_left = clock_node.get_time_remaining()
	GlobalData.update_level_time(level_name, time_left)
	
func _decrease_score() -> void:
	score -= 1

func _on_player_lost() -> void:
	score = 0
