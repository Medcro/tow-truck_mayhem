extends RigidBody2D

@export var distance: int = 1000
var initial_position : Vector2

func _ready():
	initial_position = $".".global_position

func _process(delta: float) -> void:
	var dist = abs(initial_position.distance_to($".".global_position))
	if dist > distance:
		linear_velocity = Vector2.ZERO
		$".".global_position = initial_position
	
