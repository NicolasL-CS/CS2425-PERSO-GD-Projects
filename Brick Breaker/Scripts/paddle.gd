# Player character controls

extends CharacterBody2D

# Player speed base value
const SPEED = 1000

# Jump velocity base value (not required in this context)
# const JUMP_VELOCITY = -400.0

# Adds a 'tag'
func ball_anim_play_BounceHit():
	pass

func _physics_process(_delta: float) -> void:
	# Adds the gravity (not required in this context)
	# if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump (not required in this context)
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Gets the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_keyboard_arrows := Input.get_axis("ui_left", "ui_right")
	if direction_keyboard_arrows:
		velocity.x = direction_keyboard_arrows * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

# Function to disable collisions on demand (set_disabled doesn't work, function deprecated)
# func player_paddle_disable_collisions(disabled_state: bool) -> void:
	# $Paddle_CollisionShape2D.set_disabled(disabled_state)
	# print("Etat de désactivation : ", disabled_state)
	# print("---")
