extends Button

func _on_pressed() -> void:
	print("button pressed")
	
	if GameState.powerups_used["invincibility"]:
		return
	if GameState.powerups_owned["invincibility"] <= 0:
		return

	GameState.powerups_owned["invincibility"] -= 1
	GameState.powerups_used["invincibility"] = true

	GameState.player_invincible = true
	print("invincible on")
	await get_tree().create_timer(5).timeout
	GameState.player_invincible = false
	GameState.powerups_used["invincibility"]=false
	print("invincible off")
