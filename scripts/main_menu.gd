extends Control
@onready var start: Button = $Start
@onready var option: Button = $Option
@onready var credits: Button = $Credits
@onready var exit: Button = $Exit 
@onready var settings: Panel = $Settings

func _ready():
	start.disabled = false
	option.disabled = false
	credits.disabled = false
	exit.disabled = false
	settings.visible = false
	
# handle start button
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn") # change scene to main

# handle option button
func _on_option_pressed() -> void:
	start.disabled = true
	option.disabled = true
	credits.disabled = true
	exit.disabled = true
	settings.visible = true

# handle credits button
func _on_credits_pressed() -> void:
	pass # Replace with function body.

# handle exit button
func _on_exit_pressed() -> void:
	get_tree().quit() # exit app


func _on_back_options_pressed() -> void:
	_ready()
