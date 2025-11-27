class_name Score
extends Node

@onready var score : int = 3
@onready var clock_node: Clock = $"../Timer"
@onready var health_node: Health = $"../../Player/Health"
@onready var checkpoint_node: Checkpoint = $"../../Checkpoint"
@onready var game_over_node: GameOverManager = $"../GameOverManager"

func _ready() -> void:
	score = clampi(score, 0, 3)
	clock_node.time_out.connect(_decrease_score)
	health_node.health_low.connect(_decrease_score)
	checkpoint_node.checkpoint_activated.connect(_reveal_stars)
	game_over_node.player_lost.connect(_on_player_lost)

# display stars in label when level is cleared
func _reveal_stars() -> void:
	pass

func _decrease_score() -> void:
	score -= 1
	print(score)

func _on_player_lost() -> void:
	score = 0
	print(score)
