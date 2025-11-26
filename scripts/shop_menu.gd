extends Control

@onready var shop: Panel = $Shop
@onready var currency_label: Label = $Shop/Currency
@onready var customization: Panel = $Customitazion 
@onready var change_mode_btn: Button = $ChangeMode

func _ready() -> void:
	switch_to_shop_mode()
	update_currency_ui()

func update_currency_ui() -> void:
	currency_label.text = str(GlobalData.tow_bucks)

func switch_to_shop_mode() -> void:
	shop.visible = true
	customization.visible = false
	change_mode_btn.text = "Customization"

func switch_to_custom_mode() -> void:
	shop.visible = false
	customization.visible = true
	change_mode_btn.text = "Shop"

func _on_change_mode_pressed() -> void:
	if shop.visible:
		switch_to_custom_mode()
	else:
		switch_to_shop_mode()

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
	if attempt_purchase(100, LevelCore.lvl0_completed, GlobalData.hasItem1):
		GlobalData.hasItem1 = true

func _on_buy_2_pressed() -> void:
	if attempt_purchase(200, LevelCore.lvl1_completed, GlobalData.hasItem2):
		GlobalData.hasItem2 = true

func _on_buy_3_pressed() -> void:
	if attempt_purchase(300, LevelCore.lvl4_completed, GlobalData.hasItem3):
		GlobalData.hasItem3 = true
