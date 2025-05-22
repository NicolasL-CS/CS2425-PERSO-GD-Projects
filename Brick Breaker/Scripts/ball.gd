extends CharacterBody2D

# Overall variables
var speed = 200
var dir = Vector2.DOWN
var is_active = true

# Sets the velocity of the ball down and left based on the 'speed' value
func _ready() -> void:
	velocity = Vector2(speed * -1, speed)

# Moves the ball
func _physics_process(delta: float) -> void:
	if is_active:
		var collision = move_and_collide(velocity * delta)
		# Tests if collisions detected
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			if collision.get_collider().has_method("hit"):
				collision.get_collider().hit()
			if collision.get_collider().has_method("ball_anim_play_BounceHit"):
				$AnimationPlayer.play("BounceHit")
		# Give extra impulse if the velocity of the ball is between declared values
		if (velocity.y > 0 and velocity.y < 100):
			velocity.y = -200
		if velocity.x == 0:
			velocity.x = -200

# Calls the related function on overlap between declared entities
func _on_deathzone_body_entered(body: Node2D) -> void:
		print("Ball entered Deathzone...")
		global_variables.playerLives_decrease()
