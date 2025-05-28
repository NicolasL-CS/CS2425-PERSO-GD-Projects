extends Node

# Gameplay variables
var player_score = 0
var player_level = 1
var player_lives = 10
var player_paddle_speed = 20

# Updates HUD values on tick (process)
func _process(delta: float) -> void:
	$CanvasLayer/Control/HBoxContainer/ScoreLabel.text = "SCORE: " + str(player_score)
	$CanvasLayer/Control/HBoxContainer/LevelLabel.text = "LEVEL: " + str(player_level)
	$CanvasLayer/Control/HBoxContainer/LivesLabel.text = "LIVES: " + str(player_lives)
	
# On call, returns player paddle speed
func get_player_paddle_speed():
	return(player_paddle_speed)

# On call, increases player score
func points_add(points):
	player_score += points

# On call, decreases player lives on calls Game Over scene at 0 life
func playerLives_decrease():
	player_lives -= 1
	print("Player lives: ",str(player_lives))
	if player_lives <= 0:
		print("Game over!")
		get_tree().change_scene_to_file("res://Scenes/Levels/game_over.tscn")
	return(player_lives)
