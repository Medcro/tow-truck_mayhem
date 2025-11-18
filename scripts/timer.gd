extends  Node
class_name timer

@onready var label = $Label
@onready var timerCountdown = $Timer

func _ready():
	timerCountdown.start()

func time_left_to_finish():
	var time_left = timerCountdown.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	label.text = "%02d : %02d" % time_left_to_finish()
	timer_ended()
	
func timer_ended():
	if time_left_to_finish() == [0.0, 0]:
		print("You LOSE") # this is just a temporary placeholder
	
