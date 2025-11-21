extends HBoxContainer

@export var health_component: Health # Health component
@export var full_heart_texture: Texture2D # Texture for a full heart
@export var empty_heart_texture: Texture2D # Texture for an empty heart

var heart_icons: Array[TextureRect] = [] # Array to hold references to heart TextureRects

func _ready():
	# Get references to all child TextureRect (hearth icons)
	for child in get_children():
		if child is TextureRect:
			heart_icons.append(child)
			
	# Connect signals and update initial state
	health_component.health_changed.connect(_on_health_changed)	
	update_heart_display() 

func update_heart_display():
	# iterates through every heart icon
	for i in range(heart_icons.size()):
		if i < health_component.health:
			heart_icons[i].texture = full_heart_texture
		else:
			heart_icons[i].texture = empty_heart_texture

func _on_health_changed(diff: int):
	update_heart_display()
