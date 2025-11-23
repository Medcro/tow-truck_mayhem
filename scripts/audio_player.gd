extends AudioStreamPlayer

const menu_music = preload("res://assets/audio/Main Menu OST.mp3")

func _play_music(music: AudioStream, volume = -16.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func stop_music() -> void:
	stop()

func play_music_level():
	_play_music(menu_music)
