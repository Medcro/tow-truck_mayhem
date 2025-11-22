extends Control
@onready var level_0: Button = %Level0
@onready var level_1: Button = %Level1
@onready var level_2: Button = %Level2
@onready var level_3: Button = %Level3
@onready var level_4: Button = %Level4
@onready var level_5: Button = %Level5
	
@onready var level_1_locked: Label = $Panel/LevelLockedContainer/Level1_locked
@onready var level_2_locked: Label = $Panel/LevelLockedContainer/Level2_locked
@onready var level_3_locked: Label = $Panel/LevelLockedContainer/Level3_locked
@onready var level_4_locked: Label = $Panel/LevelLockedContainer/Level4_locked
@onready var level_5_locked: Label = $Panel/LevelLockedContainer/Level5_locked


@onready var panel: Panel = $Panel

@onready var level_0_description: Panel = $Level0Description
@onready var level_1_description: Panel = $Level1Description
@onready var level_2_description: Panel = $Level2Description
@onready var level_3_description: Panel = $Level3Description
@onready var level_4_description: Panel = $Level4Description
@onready var level_5_description: Panel = $Level5Description

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_level_1()
	set_level_2()
	set_level_3()
	set_level_4()
	set_level_5()
	
	panel.visible = true
	hide_all_description()

func _on_level_0_pressed() -> void:
	panel.visible = false
	level_0_description.visible = true	
	

func _on_level_1_pressed() -> void:
	panel.visible = false
	level_1_description.visible = true	

func _on_level_2_pressed() -> void:
	panel.visible = false
	level_2_description.visible = true	


func _on_level_3_pressed() -> void:
	panel.visible = false
	level_3_description.visible = true	


func _on_level_4_pressed() -> void:
	panel.visible = false
	level_4_description.visible = true	


func _on_level_5_pressed() -> void:
	panel.visible = false
	level_5_description.visible = true	


func hide_all_description() -> void:
	level_0_description.visible = false
	level_1_description.visible = false
	level_2_description.visible = false
	level_3_description.visible = false
	level_4_description.visible = false
	level_5_description.visible = false


func set_level_1() -> void:
	if LevelCore.lvl0_completed:
		level_1_locked.visible = false	
		level_1.visible = true
	if LevelCore.lvl0_completed == false:
		level_1_locked.visible = true	
		level_1.visible = false

func set_level_2() -> void:
	if LevelCore.lvl1_completed:
		level_2_locked.visible = false	
		level_2.visible = true
	if LevelCore.lvl1_completed == false:
		level_2_locked.visible = true	
		level_2.visible = false

func set_level_3() -> void:
	if LevelCore.lvl2_completed:
		level_3_locked.visible = false	
		level_3.visible = true
	if LevelCore.lvl2_completed == false:
		level_3_locked.visible = true	
		level_3.visible = false

func set_level_4() -> void:
	if LevelCore.lvl3_completed:
		level_4_locked.visible = false	
		level_4.visible = true
	if LevelCore.lvl3_completed == false:
		level_4_locked.visible = true	
		level_4.visible = false

func set_level_5() -> void:
	if LevelCore.lvl4_completed:
		level_5_locked.visible = false	
		level_5.visible = true
	if LevelCore.lvl4_completed == false:
		level_5_locked.visible = true	
		level_5.visible = false

func _on_back_button_pressed() -> void:
	_ready()

func _on_accept_level_0() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_accept_level_1() -> void:
	pass # Replace with function body.

func _on_accept_level_2() -> void:
	pass # Replace with function body.

func _on_accept_level_3() -> void:
	pass # Replace with function body.

func _on_accept_level_4() -> void:
	pass # Replace with function body.

func _on_accept_level_5() -> void:
	pass # Replace with function body.
