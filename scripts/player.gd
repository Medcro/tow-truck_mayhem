extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_texture()

func set_texture() -> void:
	$"Tow-Truck/Sprite2D2".set_self_modulate(GlobalData.truck_color_array[GlobalData.current_truck])
	$Car/Sprite2D2.texture = GlobalData.car_array[GlobalData.current_car]
