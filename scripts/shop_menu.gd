extends Control

@onready var shop: Panel = $Shop
@onready var currency_label: Label = $Shop/Currency
@onready var buyed_1: TextureRect = $Shop/Buyed
@onready var buyed_2: TextureRect = $Shop/Buyed2
@onready var buyed_3: TextureRect = $Shop/Buyed3

func _ready() -> void:
	update_currency_ui()
	buyed_1.visible = false
	buyed_2.visible = false
	buyed_3.visible = false

func update_currency_ui() -> void:
	currency_label.text = str(GlobalData.tow_bucks)

func attempt_purchase(cost: int, is_level_unlocked: bool, already_owned: bool) -> bool:
	if not is_level_unlocked:
		return false
	if already_owned:
		return false 
	if GlobalData.tow_bucks < cost:
		return false

	GlobalData.tow_bucks -= cost
	update_currency_ui()
	return true

func _on_buy_pressed() -> void:
	if attempt_purchase(5, GlobalData.is_level_complete("Level_0"), GlobalData.hasItem1):
		GlobalData.hasItem1 = true
		buyed_1.visible = true

func _on_buy_2_pressed() -> void:
	print("clicked")
	if attempt_purchase(35, GlobalData.is_level_complete("Level_1"), GlobalData.hasItem2):
		GlobalData.hasItem2 = true
		buyed_1.visible = true

func _on_buy_3_pressed() -> void:
	print("clicked")
	if attempt_purchase(65, GlobalData.is_level_complete("Level_4"), GlobalData.hasItem3):
		GlobalData.hasItem3 = true
		buyed_1.visible = true

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
