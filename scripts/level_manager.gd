extends Node2D
@export var level_name : String = "Level_0"

@onready var level_start_sfx: AudioStreamPlayer = $LevelStartSfx
@onready var checkpoint_node = $Checkpoint 
@onready var clock_node = $CanvasLayer/Timer
@onready var player : CharacterBody2D  = $"Player/Tow-Truck"
@onready var gameplay_ost: AudioStreamPlayer = $GameplayOST
@onready var gameplay_ost_start: AudioStreamPlayer = $GameplayOST_start

func _ready() -> void:
	GameState.reset_powerups()
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

func _process(delta: float) -> void:
	get_input()

func get_input():
	if Input.is_action_just_pressed("speed_boost") and GlobalData.hasItem1:
		if not GameState.powerups_used["speed_boost"]:
			trigger_speed_boost()

	if Input.is_action_just_pressed("time_stop") and GlobalData.hasItem2:
		if not GameState.powerups_used["stop_time"]:
			GameState.activate_stop_time()

	if Input.is_action_just_pressed("invicibility") and GlobalData.hasItem3:
		if not GameState.powerups_used["invincibility"]:
			trigger_invincibility()

func trigger_speed_boost():
	GameState.powerups_used["speed_boost"] = true # Lock it for this run
	GameState.player_boost = true
	print("Boost Activated!")
	await get_tree().create_timer(3).timeout
	GameState.player_boost = false

func trigger_invincibility():
	GameState.powerups_used["invincibility"] = true # Lock it for this run
	GameState.player_invincible = true
	print("Invincibility Activated!")
	await get_tree().create_timer(5).timeout
	GameState.player_invincible = false

func _on_checkpoint_activated():
	player.input_enabled = false
