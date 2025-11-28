extends Node

var TowTruck: CharacterBody2D = null

var powerups_used = {
	"invincibility": false,
	"stop_time": false,
	"speed_boost": false
}

var player_invincible := false
var time_stopped = false
var player_boost = false

func reset_powerups():
	print("Resetting Powerups for new run...")
	player_invincible = false
	time_stopped = false
	player_boost = false
	
	for key in powerups_used.keys():
		powerups_used[key] = false


func activate_stop_time():
	if powerups_used["stop_time"]:
		return

	powerups_used["stop_time"] = true
	
	time_stopped = true
	print("TIME STOPPED")
	
	await get_tree().create_timer(10).timeout
	
	time_stopped = false
	print("Time Resumed")
