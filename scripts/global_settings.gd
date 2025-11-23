extends Node
const SETTINGS_PATH = "user://settings.cfg"
var volume_level: float = 0.5

func _ready():
	load_settings()

func save_settings():
	var config = ConfigFile.new()

	config.set_value("Audio", "volume", volume_level)
	config.save(SETTINGS_PATH)

func load_settings():
	var config = ConfigFile.new()
	var err = config.load(SETTINGS_PATH)

	if err == OK:
		volume_level = config.get_value("Audio", "volume", 1.0)
		
		var bus_index = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(volume_level))
