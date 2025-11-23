class_name TowTruck
extends CharacterBody2D

@onready var sfx_drive: AudioStreamPlayer2D = $sfx_engine

# Vehicle Tuning Properties
@export var wheel_base: float = 70.0 
@export var steering_angle: float = 15.0 
@export var engine_power: float = 800.0 
@export var braking_power: float = -450.0 
@export var max_speed_reversed: float = 250.0 
@export var friction: float = -0.9 
@export var drag: float = -0.001 
@export var slip_speed: float = 400.0 
@export var traction_fast: float = 0.1 
@export var traction_slow: float = 0.7 

# NEW: Control switch
var input_enabled: bool = true

var acceleration: Vector2 = Vector2.ZERO
var steer_direction: float = 0.0 

func _ready():
	sfx_drive.play()
	
func _physics_process(delta: float):
	handleSound()
	
	acceleration = Vector2.ZERO
	
	get_input()
	apply_friction()
	calculate_steering(delta)
	
	velocity += acceleration * delta
	move_and_slide()

# MODIFIED: Handles user input vs Automatic braking
func get_input():
	if input_enabled:
		# --- NORMAL DRIVING ---
		var turn: int = 0
		if Input.is_action_pressed("steer_left"):
			turn -= 1
		if Input.is_action_pressed("steer_right"):
			turn += 1

		steer_direction = turn * deg_to_rad(steering_angle)

		if Input.is_action_pressed("accelerate"):
			acceleration = transform.x * engine_power
		if Input.is_action_pressed("brake"):
			acceleration = transform.x * braking_power
			
	else:
		# --- CHECKPOINT REACHED (AUTO-STOP) ---
		# 1. Stop turning so we brake in a straight line
		steer_direction = 0.0 
		
		# 2. If we are still moving, apply the brakes programmatically
		if velocity.length() > 10:
			# Use your existing braking_power variable
			acceleration = transform.x * braking_power 
		else:
			# If very slow, snap to zero to prevent sliding forever
			velocity = Vector2.ZERO
			sfx_drive.stop() # Kill the engine sound

# ... (Keep calculate_steering, apply_friction, and handleSound exactly as they were) ...
func calculate_steering(delta: float):
	# determined the position of the front wheel and the rear wheel
	var rear_wheel: Vector2 = global_position - transform.x * wheel_base / 2.0
	var front_wheel: Vector2 = global_position + transform.x * wheel_base / 2.0

	rear_wheel += velocity * delta # moving in line with velocity
	front_wheel += velocity.rotated(steer_direction) * delta # moving along with the rotated velocity
	
	var new_heading: Vector2 = (front_wheel - rear_wheel).normalized() # calculate
	
	var traction: float = traction_slow
	if velocity.length() > slip_speed:
		traction = traction_fast
	
	# calculate the dot product to determined whether the truck is moving forward or backward
	var d: float = new_heading.dot(velocity.normalized())
	if d > 0: # moving forward
		# smoothly interpolate the velocity to the new heading
		velocity = velocity.lerp(new_heading * velocity.length(), traction) 
	if d < 0: # moving backward
		# moving backward with a limit of "max_speed_reversed"
		velocity = - new_heading * min(velocity.length(), max_speed_reversed)
		
	# rotate the sprite of the truck
	rotation = new_heading.angle()

func apply_friction():
	if velocity.length() < 5:
		velocity = Vector2.ZERO
		
	var friction_force: Vector2 = velocity * friction
	var drag_force: Vector2 = velocity * velocity.length() * drag
	
	acceleration += drag_force + friction_force

func handleSound():
	var newVal = (velocity.length() / 250) + 0.5
	sfx_drive.set_pitch_scale(newVal)
