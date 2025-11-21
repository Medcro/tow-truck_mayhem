class_name Hurtbox
extends Area2D

@export var health: Health # references to health component
@export var invincibility_duration: float = 0.5
@onready var car_crash_sfx: AudioStreamPlayer2D = $"../../Car_Crash_SFX"

signal hit_received(damage: int, body: Node2D) # emitted when the damage is aplly
signal player_lost # Emitted when the linked health component reports that health has been depleted to zero

# track which collision objects are currently hitting the hurtbox
var collided_bodies: Array[Node2D] = []

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	if health == null:
		health = get_parent().get_parent().get_node_or_null("Health")

# take damage and assign the collision in to collided bodies
func _on_body_entered(body: Node2D):
	if body is Collision and body not in collided_bodies:
		collided_bodies.append(body)
		take_damage(body)

# erase collision from collided bodies list
func _on_body_exited(body: Node2D):
	if body in collided_bodies:
		collided_bodies.erase(body)

# taking damage and set temporary immorrality
func take_damage(collision_body: Collision):
	health.health -= collision_body.damage
	hit_received.emit(collision_body.damage, collision_body)
	
	health.set_temporary_immortality(invincibility_duration)
	car_crash_sfx.play()
	

# when the healths reaches zeo
func _on_health_depleted() -> void:
	emit_signal("player_lost")
