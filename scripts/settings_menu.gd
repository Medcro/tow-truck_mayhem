extends Control

@onready var music_slider = $MusicSlider 

var music_bus_id

func _ready():
	music_bus_id = AudioServer.get_bus_index("Master")
	music_slider.value = GlobalSettings.volume_level

func _on_back_button_pressed() -> void:
	get_parent().get_node("PauseMenu").visible = true
	self.visible = false

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_id, value)
	
	GlobalSettings.volume_level = value
	GlobalSettings.save_settings()
