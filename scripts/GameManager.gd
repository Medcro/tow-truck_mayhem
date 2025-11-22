extends Node2D
@onready var level_start_sfx: AudioStreamPlayer = $LevelStartSfx


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_start_sfx.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
