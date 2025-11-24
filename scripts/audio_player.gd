extends AudioStreamPlayer

const MUSIC_BUS_NAME = "Music"
const menu_music = preload("res://assets/audio/Main Menu OST.mp3")

func _ready() -> void:
	bus = MUSIC_BUS_NAME

func _play_music(music: AudioStream, volume = -8.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func stop_music() -> void:
	stream = null

func play_music_level():
	_play_music(menu_music)
