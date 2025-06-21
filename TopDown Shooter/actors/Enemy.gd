extends CharacterBody2D

# Variables
@export var fade_duration: float = 0.25
@onready var sprite = $Character
@onready var animation_player = $AnimationPlayer
# Temp
var health: float = 100


# Called everytime on object which implements "handle_hit()" overlaps
func handle_hit():
	health -= 20
	print("Enemy hit! ", health, " HP remaining.")
	if health <= 0:
		start_fade_out()

# Fades the enemy via a 'Tween' effect
func start_fade_out() -> void:
	var _tween := create_tween()
	animation_player.play("character_fade")
