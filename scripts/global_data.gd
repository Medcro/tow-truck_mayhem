extends Node

var truck_color_array : Array = [Color("ffffff"), Color("ffff00"), Color("ff0000"), Color("28192f")]
var car_array : Array = []
var tow_bucks = 100000
var hasItem1 : bool = false
var hasItem2 : bool = false
var hasItem3 : bool = false

var current_truck : int = 0
var current_car : int = 0

func _ready() -> void:
	get_data()

func get_data() -> void:
	for file in ResourceLoader.list_directory("res://assets/cars/cars"):
		if file.contains(".import"):
			continue
		car_array.append(load("res://assets/cars/cars/" + file))
