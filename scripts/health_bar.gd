extends TextureProgressBar

@export var health_component: Health 

func _ready() -> void:
	if health_component:
		health_component.health_changed.connect(_on_health_changed)
		max_value = health_component.max_health
		update_bar()

func update_bar():
	value = health_component.health

func _on_health_changed(_diff: int):
	update_bar()
