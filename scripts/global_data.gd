extends Node

const SAVEFILE = "user://savefile.save"

var truck_color_array : Array = [Color("ffffff"), Color("ffff00"), Color("ff0000"), Color("28192f")]
var car_array : Array = []
var tow_bucks = 0
var hasItem1 : bool = false
var hasItem2 : bool = false
var hasItem3 : bool = false
var completed_levels: Dictionary = {}
var level_scores : Dictionary = {}
var level_times : Dictionary = {}

var current_truck : int = 0
var current_car : int = 0

func _ready() -> void:
	get_data()
	load_game_data()

func mark_level_complete(level_name: String) -> void:
	if not completed_levels.get(level_name, false):
		completed_levels[level_name] = true
		save_game_data()

func update_level_time(level_name: String, time_remaining: float) -> void:
	var current_best = level_times.get(level_name, 0.0)
	
	if time_remaining > current_best:
		level_times[level_name] = time_remaining
		save_game_data()
		
func update_level_score(level_name: String, new_score: int) -> void:
	var current_high = level_scores.get(level_name, 0)
	
	if new_score > current_high:
		level_scores[level_name] = new_score
		save_game_data()
		
func get_data() -> void:
	for file in ResourceLoader.list_directory("res://assets/cars/cars"):
		if file.contains(".import"):
			continue
		car_array.append(load("res://assets/cars/cars/" + file))

func is_level_complete(level_name: String) -> bool:
	return completed_levels.get(level_name, false)		
		
func save_game_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	
	var save_data = {
		"completed": completed_levels,
		"scores": level_scores,
		"times": level_times,
		"money": tow_bucks,
		"truck_idx": current_truck,
		"car_idx": current_car
	}
	file.store_var(save_data)

func load_game_data():
	if not FileAccess.file_exists(SAVEFILE):
		return 
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	var save_data = file.get_var()

	completed_levels = save_data.get("completed", {})
	level_scores = save_data.get("scores", {})
	level_times = save_data.get("times", {})
	tow_bucks = save_data.get("money", 0)
	current_truck = save_data.get("truck_idx", 0)
	current_car = save_data.get("car_idx", 0)
