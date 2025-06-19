extends CharacterBody2D

# Variables
@export var speed: int = 100
var movement_direction := Vector2.ZERO

# Called when owner object is loaded
func _ready() -> void:
	pass # Replace with fuction body

# Called on every frame of physical objects
func _physics_process(delta: float) -> void:
	# Gets inputs and sets vector (movement_direction) value according to the related input
	movement_direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	movement_direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	movement_direction = movement_direction.normalized()
	velocity = movement_direction * speed
	move_and_slide()
	# Turns player to mouse position
	look_at(get_global_mouse_position())
