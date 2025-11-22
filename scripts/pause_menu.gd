extends CanvasLayer

@onready var pause_menu = $PauseMenu
@onready var settings_menu = $SettingsMenu
@onready var click_sound = $ClickSound  

func _ready():
	pause_menu.visible = false
	settings_menu.visible = false

func _on_pause_button_pressed() -> void:	
	if click_sound:
		click_sound.play()
	get_tree().paused = true
	pause_menu.visible = true

func _on_resume_button_pressed() -> void:
	if click_sound:
		click_sound.play()
	get_tree().paused = false
	pause_menu.visible = false

func _on_quit_button_pressed() -> void:
	if click_sound:
		click_sound.play()
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	if click_sound:
		click_sound.play()
	pause_menu.visible = false
	settings_menu.visible = true

func _on_main_menu_button_pressed() -> void:
	if click_sound:
		click_sound.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
