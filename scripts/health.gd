class_name Health
extends Node

signal max_health_changed(diff: int) # emiited when the max health changed
signal health_changed(diff: int) # emitted when the health changed
signal health_depleted # emitted when the health reaches zero

@export var max_health: int = 5 : set = set_max_health, get = get_max_health
@export var immortality: bool = false : set = set_immortality, get = get_immortality

# set a time for immortality
var immortality_timer: Timer = null

# initialized the entitiy's health
@onready var health: int = max_health : set = set_health, get = get_health


func set_max_health(value: int):
	# ensure max health is always at least 1
	var clamped_value = 1 if value <= 0 else value
	
	# calculate the differences when the health's value changed
	if clamped_value != max_health:
		var difference = clamped_value - max_health
		max_health = value
		max_health_changed.emit(difference)
		
		if health > max_health:
			health = max_health

func get_max_health() -> int:
	return max_health

func set_immortality(value: bool):
	immortality = value

func get_immortality() -> bool:
	return immortality

func set_temporary_immortality(time: float):
	# initialized a new timer node when the timer doesn't exist
	if immortality_timer == null:
		immortality_timer = Timer.new()
		immortality_timer.one_shot = true
		add_child(immortality_timer)
		
	# prevent multiple timer in node
	if immortality_timer.timeout.is_connected(set_immortality):
		immortality_timer.timeout.disconnect(set_immortality)
	
	# start the timer
	immortality_timer.set_wait_time(time)
	immortality_timer.timeout.connect(set_immortality.bind(false))
	immortality = true
	immortality_timer.start()
	
func set_health(value: int):
	# if entitiy takes damage and it's still in state of immortality, no change is made
	if value < health and immortality:
		return 
	
	# the value is clamped between 0 and max_health
	var clamped_value = clampi(value, 0, max_health)
	
	# calculate the differences when the health's value changed
	if clamped_value != health:
		var difference = clamped_value - health
		health = value
		health_changed.emit(difference)
		
		# emits the health_depleted signal
		if health == 0:
			health_depleted.emit()
		
func get_health():
	return health
