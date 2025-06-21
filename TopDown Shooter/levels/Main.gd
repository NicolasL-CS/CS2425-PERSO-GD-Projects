extends Node2D

# Variables
@onready var bullets_manager = $BulletsManager
@onready var player = $Player

# Called when object is ready
func _ready() -> void:
	player.connect("player_fired_bullet", Callable(bullets_manager, "handle_bullet_spawned"))
