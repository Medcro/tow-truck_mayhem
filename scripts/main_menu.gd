extends Control

@onready var main_buttons: Array[Button] = [
	$Start,
	$Option,
	$Credits,
	$Exit
]

@onready var settings: Panel = $Settings
@onready var confirmation_exit: Panel = $ConfirmationExit
@onready var credits_panel: Panel = $CreditsPanel
@onready var button_sfx: AudioStreamPlayer = $ButtonPressed_SFX

# Main menu's default state
func _ready():
	set_buttons_enabled(true)
	hide_all_panels()

# Enable/disable all main menu buttons
func set_buttons_enabled(enabled: bool) -> void:
	for button in main_buttons:
		button.disabled = not enabled

# Hide all popup panels
func hide_all_panels() -> void:
	settings.visible = false
	confirmation_exit.visible = false
	credits_panel.visible = false

# Play button sound effect
func play_button_sound() -> void:
	button_sfx.play()

# Show a panel and disable main buttons
func show_panel(panel: Panel) -> void:
	play_button_sound()
	set_buttons_enabled(false)
	panel.visible = true

# Close current panel and return to main menu
func close_panel() -> void:
	play_button_sound()
	_ready()

# Button handlers
func _on_start_pressed() -> void:
	play_button_sound()
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_option_pressed() -> void:
	show_panel(settings)

func _on_credits_pressed() -> void:
	play_button_sound()
	credits_panel.visible = true

func _on_exit_pressed() -> void:
	show_panel(confirmation_exit)

func _on_back_options_pressed() -> void:
	play_button_sound()
	close_panel()

func _on_yes_pressed() -> void:
	play_button_sound()
	get_tree().quit()

func _on_no_pressed() -> void:
	play_button_sound()
	close_panel()

func _on_back_pressed() -> void:
	play_button_sound()
	close_panel()
