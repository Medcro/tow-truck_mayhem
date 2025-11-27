extends Button

func _on_pressed() -> void:
	print("time stop button pressed")
	GameState.activate_stop_time()
