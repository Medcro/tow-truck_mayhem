extends Node2D
@export var level_name : String = "Level_0"

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

func get_input():
	if Input.is_action_pressed("speed_boost") and GlobalData.hasItem1:
		if GameState.powerups_used["speed_boost"]:
			return
	
		if GameState.powerups_owned["speed_boost"] <= 0:
			return
	
		GameState.powerups_owned["speed_boost"] -= 1
		GameState.powerups_used["speed_boost"] = true

		GameState.player_boost = true

		await get_tree().create_timer(3).timeout

		GameState.player_boost = false
		GameState.powerups_used["speed_boost"] = false
	
	if Input.is_action_pressed("time_stop") and GlobalData.hasItem2:
		GameState.activate_stop_time()
	
	if Input.is_action_pressed("invicibility") and GlobalData.hasItem3:
		if GameState.powerups_used["invincibility"]:
			return
		if GameState.powerups_owned["invincibility"] <= 0:
			return

		GameState.powerups_owned["invincibility"] -= 1
		GameState.powerups_used["invincibility"] = true

		GameState.player_invincible = true
		await get_tree().create_timer(5).timeout
		GameState.player_invincible = false
		GameState.powerups_used["invincibility"]=false

func _on_checkpoint_activated():
	player.input_enabled = false
