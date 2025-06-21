extends Area2D
class_name Bullet

# Variables
@export var bullet_speed: float = 2000
@export var bullet_range: float = 500
@export var fade_duration: float = 0.25
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
var direction: Vector2 = Vector2.ZERO
var start_position: Vector2 = Vector2.ZERO
var is_fading := false
enum hit_type {HIT, NO_HIT}
var hit_state

# Called when the object is ready
func _ready() -> void:
	start_position = global_position
	
# Called every physics frame
func _physics_process(delta: float) -> void:
	if is_fading:
		return
	if direction != Vector2.ZERO:
		var velocity = direction * bullet_speed * delta
		global_position += velocity
	var distance_traveled = start_position.distance_to(global_position)
	# print("Distance parcourue : ", distance_traveled, " / Portée max : ", bullet_range) # returns the bullet motion to checks if values are correct
	if distance_traveled >= bullet_range:
		hit_state = hit_type.NO_HIT
		bullet_animation()

# Called to sets the direction and pass it
func set_direction(direction: Vector2):
	self.direction = direction
	
# Called on every overlap
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):
		body.handle_hit()
		hit_state = hit_type.HIT
		bullet_animation()

# Fades the bullet via an Animation Player /OR/ a 'Tween' effect
func bullet_animation() -> void:
	is_fading = true
	if hit_state == hit_type.HIT:
		animation_player.play("bullet_hit")
	if hit_state == hit_type.NO_HIT:
		animation_player.play("bullet_nohit")
	# var tween := create_tween()
	# tween.tween_property(self, "scale", Vector2.ZERO, fade_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	# tween.tween_property(sprite, "modulate:a", 0.0, fade_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	# tween.tween_callback(Callable(self, "queue_free")).set_delay(fade_duration)
