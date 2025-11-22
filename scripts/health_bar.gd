extends TextureProgressBar

@export var health_component: Health # Health component

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_component.health_changed.connect(_on_health_changed)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update():
	value = health_component.health * 100 / (health_component.max_health)

func _on_health_changed(diff: int):
	update()
