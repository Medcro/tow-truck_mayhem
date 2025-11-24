class_name Hurtbox
extends Area2D

@export var health: Health 
@export var invincibility_duration: float = 0.5
@onready var car_crash_sfx: AudioStreamPlayer = $"../../Car_Crash_SFX"

signal hit_received(damage: int, body: Node2D) 
signal player_lost 

var collided_bodies: Array[Node2D] = []

func _ready():
	body_exited.connect(_on_body_exited)
	
	if health == null:
		health = get_parent().get_parent().get_node_or_null("Health")

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int):
	if body is Collision and body not in collided_bodies:
		collided_bodies.append(body)
		take_damage(body.damage, body)

	elif body is TileMapLayer:
		# Calculate where the Player is on the grid
		var player_map_pos = body.local_to_map(body.to_local(global_position))
		
		var tiles_to_check = [
			Vector2i(0, 0),  # Center (under player)
			Vector2i(0, -1), # Up
			Vector2i(0, 1),  # Down
			Vector2i(-1, 0), # Left
			Vector2i(1, 0)   # Right
		]
		
		for offset in tiles_to_check:
			var check_pos = player_map_pos + offset
			var tile_data = body.get_cell_tile_data(check_pos)
			
			if tile_data:
				var damage_amount = tile_data.get_custom_data("damage")

				if damage_amount > 0:
					print("Hit Obstacle at: ", check_pos)
					take_damage(damage_amount, body)
					return 

func _on_body_exited(body: Node2D):
	if body in collided_bodies:
		collided_bodies.erase(body)

func take_damage(amount: int, body_source: Node2D):
	if health.immortality:
		return
	
	car_crash_sfx.play()
	
	health.health -= amount
	hit_received.emit(amount, body_source)
	
	health.set_temporary_immortality(invincibility_duration)

func _on_health_depleted() -> void:
	emit_signal("player_lost")
