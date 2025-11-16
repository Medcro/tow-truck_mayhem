extends Control

# handle start button
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn") # change scene to main

# handle option button
func _on_option_pressed() -> void:
	pass # Replace with function body.

# handle credits button
func _on_credits_pressed() -> void:
	pass # Replace with function body.

# handle exit button
func _on_exit_pressed() -> void:
	get_tree().quit() # exit app
