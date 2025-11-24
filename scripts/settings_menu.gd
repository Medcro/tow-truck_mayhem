extends Control

@onready var music_slider = $MusicSlider 
@onready var sfx_slider: HSlider = $SFXSlider

var music_bus_id
var sfx_bus_id

func _ready():
	music_bus_id = AudioServer.get_bus_index("Music")
	sfx_bus_id = AudioServer.get_bus_index("SFX")
	music_slider.value = GlobalSettings.music_volume
	sfx_slider.value = GlobalSettings.sfx_volume

func _on_back_button_pressed() -> void:
	get_parent().get_node("PauseMenu").visible = true
	self.visible = false

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_id, linear_to_db(value))
	GlobalSettings.music_volume = value
	GlobalSettings.save_settings()

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_id, linear_to_db(value))
	GlobalSettings.sfx_volume = value
	GlobalSettings.save_settings()
