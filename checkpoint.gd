extends Area2D

var activated := false
signal checkpoint_activated(position: Vector2)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Tow-Truck" and not activated:
		activated = true
		emit_signal("checkpoint_activated", global_position)
		get_tree().change_scene_to_file("res://level_select.tscn")
