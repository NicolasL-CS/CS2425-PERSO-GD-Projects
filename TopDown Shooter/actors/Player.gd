extends CharacterBody2D
class_name Player

# Variables
@export var Bullet: PackedScene
@export var fire_rate: float = 0.25
@onready var gun_barrel = $GunBarrel
@onready var animation_player = $AnimationPlayer
var player_speed = Global.player_speed_base
var movement_direction := Vector2.ZERO
var can_shoot: bool = true
signal player_fired_bullet(bullet, position, direction)

# Temp
var health:float = 100

# Called when owner object is loaded
func _ready() -> void:
	pass # Replace with fuction body

# Called on every frame of physical objects
func _physics_process(delta: float) -> void:
	# Gets inputs and sets vector (movement_direction) value according to the related input
	movement_direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	movement_direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	movement_direction = movement_direction.normalized()
	velocity = movement_direction * player_speed
	move_and_slide()
	look_at(get_global_mouse_position()) # Turns player to mouse position

# Called everytime the delcared inputs are used
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("Shoot"):
		shoot() # Player shoot function call

# Player shoot function: creates an instance of the bullet and trigger behaviour
func shoot():
	if not can_shoot:
		return
	can_shoot = false
	var bullet_instance = Bullet.instantiate() # Creates instance of the bullet
	bullet_instance.global_position = gun_barrel.global_position # Sets the bullet position
	bullet_instance.rotation = rotation # Sets the bullet rotation
	var target = get_global_mouse_position() # Creates bullet target point
	bullet_instance.direction = (target - gun_barrel.global_position).normalized()
	bullet_instance.start_position = gun_barrel.global_position
	emit_signal("player_fired_bullet", bullet_instance, gun_barrel.global_position, bullet_instance.direction)
	animation_player.play("muzzle_flash")
	# Rate of fire timer
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true

# Called everytime on object which implements "handle_hit()" overlaps
func handle_hit():
	health -= 20
	print("Player hit! ", health, " HP remaining.")
