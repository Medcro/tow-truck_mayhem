extends Node

# Signal emitted when the timer runs out and the player loses
signal player_lost

@onready var label: Label = $Label 
@onready var timer: Timer = $Timer 
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer  

func _ready():
	timer.start()  # Starts the countdown timer

# function to calculate time remaining
func time_left_to_finished():
	var time_left = timer.time_left 
	var minute = floor(time_left / 60)  
	var second = int(time_left) % 60  
	return [minute, second]

func _process(delta):
	# Format: MM:SS with leading zeros (e.g., "05:09")
	label.text = "%02d:%02d" % time_left_to_finished()

# Called when the timer reaches zero
func _on_timer_timeout() -> void:
	audio_stream_player.play() 
	get_tree().paused = true  
	emit_signal("player_lost")  # Notify other nodes that the player lost
