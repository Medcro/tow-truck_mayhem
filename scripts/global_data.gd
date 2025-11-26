extends Node

var truck_color_array : Array = [Color("ffffff"), Color("ffff00"), Color("ff0000"), Color("28192f")]
var car_array : Array = []

var current_truck : int = 0
var current_car : int = 0

func _ready() -> void:
	get_data()

func get_data() -> void:
	for file in ResourceLoader.list_directory("res://assets/cars/cars"):
		if file.contains(".import"):
			continue
		car_array.append(load("res://assets/cars/cars/" + file))
