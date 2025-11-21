extends Node
class_name GameOverManager

# initialized panel and audio when the game over is triggered
@onready var panel: Panel = $Panel
@onready var game_over_sound: AudioStreamPlayer = $Explosion

# assign clock and health node
@onready var clock_node: Clock = $"../Timer"
@onready var health_node: Health = $"../../Player/Health"

# set the default satte and connect signal
func _ready():
	get_tree().paused = false
	panel.visible = false
	clock_node.time_out.connect(_on_player_lost)
	health_node.health_depleted.connect(_on_player_lost)

# return to main menu
func _on_back_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") # change scene to main menu

# restart the scene
func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

# when the signal emitted, pause the game set the visibility of the panel to true
func _on_player_lost() -> void:
	panel.visible = true
	get_tree().paused = true
	game_over_sound.play()
