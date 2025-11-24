extends Node2D
class_name Checkpoint

var activated := false
signal checkpoint_activated

@onready var detection_area: Area2D = $Area2D
@onready var winning_sfx: AudioStreamPlayer = $WinningSfx

@export var highlight_color: Color = Color.DARK_BLUE:
	set(value):
		highlight_color = value
		queue_redraw()

func _ready() -> void:
	detection_area.body_entered.connect(_on_body_entered)
	queue_redraw()

func _draw():
	var collision_node = detection_area.get_node_or_null("CollisionShape2D")
	
	if collision_node and collision_node.shape:
		var shape = collision_node.shape
		if shape is RectangleShape2D:
			var rect_bounds = Rect2(-shape.size / 2, shape.size)
			draw_rect(rect_bounds, highlight_color)
		elif shape is CircleShape2D:
			draw_circle(Vector2.ZERO, shape.radius, highlight_color)

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Tow-Truck" or body.name == "Car") and not activated:
		activated = true
		winning_sfx.play()
		checkpoint_activated.emit()
		await get_tree().create_timer(2.5).timeout
		AudioPlayer.play_music_level()
		get_tree().change_scene_to_file("res://scenes/level_select.tscn")
