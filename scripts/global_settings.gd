extends Node
const SETTINGS_PATH = "user://settings.cfg"
var music_volume: float = 1
var sfx_volume: float = 1

func _ready():
	load_settings()

func save_settings():
	var config = ConfigFile.new()

	config.set_value("Audio", "music_volume", music_volume)
	config.set_value("Audio", "sfx_volume", sfx_volume)
	config.save(SETTINGS_PATH)

func load_settings():
	var config = ConfigFile.new()
	var err = config.load(SETTINGS_PATH)

	if err == OK:
		music_volume = config.get_value("Audio", "music_volume", 0.5)
		sfx_volume = config.get_value("Audio", "sfx_volume", 0.5)
		var music_bus_index = AudioServer.get_bus_index("Music")
		AudioServer.set_bus_volume_db(music_bus_index, linear_to_db(music_volume))
		var sfx_bus_index = AudioServer.get_bus_index("SFX")
		AudioServer.set_bus_volume_db(sfx_bus_index, linear_to_db(sfx_volume))
