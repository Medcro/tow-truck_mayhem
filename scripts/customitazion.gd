extends Panel

var temp_truck_index: int = 0
var temp_car_index: int = 0

func _ready() -> void:
	connect_signals()
	
func connect_signals() -> void:
	%TruckBack.connect("pressed", truck_back)
	%TruckForw.connect("pressed", truck_forw) 
	%CarBack.connect("pressed", car_back)
	%CarForw.connect("pressed", car_forw)
	%save.connect("pressed", save)

func truck_back() -> void:
	GlobalData.current_truck = (GlobalData.current_truck - 1) % GlobalData.truck_color_array.size()
	%"tow-truck".set_self_modulate(GlobalData.truck_color_array[GlobalData.current_truck])
	
func truck_forw() -> void:
	GlobalData.current_truck = (GlobalData.current_truck + 1) % GlobalData.truck_color_array.size()
	%"tow-truck".set_self_modulate(GlobalData.truck_color_array[GlobalData.current_truck])
	
func car_back() -> void:
	GlobalData.current_car = (GlobalData.current_car - 1) % GlobalData.car_array.size()
	%car.texture = GlobalData.car_array[GlobalData.current_car]

func car_forw() -> void:
	GlobalData.current_car = (GlobalData.current_car + 1) % GlobalData.car_array.size()
	%car.texture = GlobalData.car_array[GlobalData.current_car]

func save() -> void:
	pass
