extends Node2D
class_name Player

@export var level_specific_car_texture: Texture2D
@onready var car_sprite: Sprite2D = $Car/Sprite2D 

func _ready() -> void:
	if level_specific_car_texture != null:
		car_sprite.texture = level_specific_car_texture
