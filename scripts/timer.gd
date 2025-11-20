extends Node
class_name timer

# getting nodes from timer nodes
@onready var label = $Label
@onready var timerCountdown = $Timer

func _ready():
	timerCountdown.start()

# determined how many time left
func time_left_to_finish():
	var time_left = timerCountdown.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	# formatting time to look like -> 00:00
	var format_string = "%02d : %02d"
	label.text = format_string % time_left_to_finish()
	timer_ended()
	
func timer_ended():
	if time_left_to_finish() == [0.0, 0]:
		print("You LOSE") # this is just a temporary placeholder
