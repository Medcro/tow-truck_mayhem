extends Button

func _on_pressed() -> void:
	print("boost pressed")
	
	if GameState.powerups_used["speed_boost"]:
		return
	
	if GameState.powerups_owned["speed_boost"] <= 0:
		return
	
	GameState.powerups_owned["speed_boost"] -= 1
	GameState.powerups_used["speed_boost"] = true
	
	GameState.player_boost = true
	print("boost on")

	await get_tree().create_timer(3).timeout

	GameState.player_boost = false
	GameState.powerups_used["speed_boost"] = false
	print("boost off")
