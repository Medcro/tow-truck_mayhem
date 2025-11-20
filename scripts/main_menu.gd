extends Control
@onready var start: Button = $Start
@onready var option: Button = $Option
@onready var credits: Button = $Credits
@onready var exit: Button = $Exit 
@onready var settings: Panel = $Settings
@onready var confirmation_exit: Panel = $ConfirmationExit
@onready var yes: Button = $ConfirmationExit/Yes
@onready var no: Button = $ConfirmationExit/No

func _ready():
	start.disabled = false
	option.disabled = false
	credits.disabled = false
	exit.disabled = false
	settings.visible = false
	confirmation_exit.visible = false
	
# handle start button
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn") # change scene to main

func disabled_button() -> void:
	start.disabled = true
	option.disabled = true
	credits.disabled = true
	exit.disabled = true

# handle option button
func _on_option_pressed() -> void:
	disabled_button()
	settings.visible = true

# handle credits button
func _on_credits_pressed() -> void:
	pass

# handle exit button
func _on_exit_pressed() -> void:
	disabled_button()
	confirmation_exit.visible = true


func _on_back_options_pressed() -> void:
	_ready()

func _on_yes_pressed() -> void:
	get_tree().quit() # exit app


func _on_no_pressed() -> void:
	_ready()
