extends Node2D

@onready var level_start_sfx: AudioStreamPlayer = $LevelStartSfx
@onready var checkpoint_node = $Checkpoint 
@onready var player : CharacterBody2D  = $"Player/Tow-Truck"

func _ready() -> void:
	if checkpoint_node:
		checkpoint_node.checkpoint_activated.connect(_on_checkpoint_activated)
	level_start_sfx.play()

func _on_checkpoint_activated():
	player.input_enabled = false
	LevelCore.lvl1_completed = true
