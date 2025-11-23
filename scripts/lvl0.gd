extends Node2D

@onready var level_start_sfx: AudioStreamPlayer = $LevelStartSfx
# Make sure this path points to the Checkpoint node in your scene
@onready var checkpoint_node = $Checkpoint 
@onready var player : CharacterBody2D  = $"Player/Tow-Truck"

func _ready() -> void:
	if checkpoint_node:
		checkpoint_node.checkpoint_activated.connect(_on_checkpoint_activated)
	level_start_sfx.play()

func _on_checkpoint_activated(position: Vector2):
	player.input_enabled = false
	LevelCore.lvl0_completed = true
