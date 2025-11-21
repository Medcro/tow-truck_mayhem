class_name Collision
extends RigidBody2D

# initialized damage this collision will have to player
@export var damage: int = 1 : set = set_damage, get = get_damage

func set_damage(value: int):
	damage = value
	
func get_damage() -> int:
	return damage
