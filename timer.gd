extends Node
class_name Clock

# Signal emitted when the timer runs out and the player loses
signal time_out
signal time_low

@onready var label: Label = $Label 
@onready var timer: Timer = $Timer 
@onready var low_timer_sfx: AudioStreamPlayer = $LowTimerSFX
@export var time: int

func _ready():
	timer.wait_time = time
	timer.start()  # Starts the countdown timer

# function to calculate time remaining
func time_left_to_finished():
	var time_left = timer.time_left 
	var minute = floor(time_left / 60)  
	var second = int(time_left) % 60  
	return [minute, second]

func _process(delta):
	# Stop updating UI if time is stopped
	if GameState.time_stopped:
		if timer.is_stopped() == false:
			timer.stop()
		return
	else:
		# Resume timer if it was stopped
		if timer.is_stopped():
			timer.start()
			
	# Format: MM:SS with leading zeros (e.g., "05:09")
	label.text = "%02d:%02d" % time_left_to_finished()
	if label.text == "00:11":
		low_timer_sfx.play()
		emit_signal("time_low")

# Called when the timer reaches zero
func _on_timer_timeout() -> void:
	emit_signal("time_out")  # Notify other nodes that the player lost
	print("Time out")
