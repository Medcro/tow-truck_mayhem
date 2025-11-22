extends Control

func _on_back_button_pressed() -> void:
	get_parent().get_node("PauseMenu").visible = true
	self.visible = false

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
