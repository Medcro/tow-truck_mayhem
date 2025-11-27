extends Node

var powerups_used = {
	"invincibility": false,
	"stop_time": false,
	"speed_boost": false
}

var powerups_owned = {
	"invincibility": 1,
	"stop_time": 1,
	"speed_boost": 0
}
var player_invincible := false
var time_stopped = false
var TowTruck : Node = null

func activate_stop_time():
	if powerups_used["stop_time"]:
		return
		
	powerups_owned["stop_time"] -= 1
	powerups_used["stop_time"] = true
	
	time_stopped = true
	print("TIME STOPPED")
	
	await get_tree().create_timer(10).timeout
	
	time_stopped = false
	print("time resumed")
	
func activate_speed_boost():
	if powerups_used["speed_boost"]:
		return
		
	if powerups_owned["speed_boost"] <= 0:
		return
		
	powerups_owned["speed_boost"] -= 1
	powerups_used["speed_boost"] = true
		
	if TowTruck:
		TowTruck.activate_speed_boost()
		print("speed boost activated")
		
func reset_powerup():
	for key in powerups_used.keys():
		powerups_used[key] = false
		
		
