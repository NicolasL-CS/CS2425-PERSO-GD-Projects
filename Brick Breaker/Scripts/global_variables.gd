extends Node

# Gameplay variables
var player_lives = 99
var player_paddle_speed = 20

# Calls Player Paddle Speed
func get_player_paddle_speed():
	return(player_paddle_speed)

# Decreases Player Lives
func playerLives_decrease():
	player_lives -= 1
	print("Player lives: ",str(player_lives))
	if player_lives <= 0:
		print("Game over!")
		get_tree().change_scene_to_file("res://Scenes/Levels/game_over.tscn")
	return(player_lives)
	
