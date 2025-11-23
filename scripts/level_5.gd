extends Node2D

@onready var level_start_sfx: AudioStreamPlayer = $LevelStartSfx
@onready var checkpoint_node = $Checkpoint 
@onready var clock_node = $CanvasLayer/Timer
@onready var player : CharacterBody2D  = $"Player/Tow-Truck"
@onready var gameplay_ost: AudioStreamPlayer = $GameplayOST
@onready var gameplay_ost_start: AudioStreamPlayer = $GameplayOST_start

func _ready() -> void:
	if clock_node:
		clock_node.time_low.connect(_on_time_low)
	if checkpoint_node:
		checkpoint_node.checkpoint_activated.connect(_on_checkpoint_activated)
	gameplay_ost_start.play()
	level_start_sfx.play()
	await get_tree().create_timer(6.5).timeout
	gameplay_ost.play()

func _on_time_low():
	gameplay_ost.pitch_scale = 1.5

func _on_checkpoint_activated():
	player.input_enabled = false
	LevelCore.lvl5_completed = true
