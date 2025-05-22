extends Node

var player_lives = 4

# Decrease Player Lives
func playerLives_decrease():
	player_lives -= 1
	print("Player lives: ",str(player_lives))
	if player_lives <= 0:
		print("Game over!")
		# Place game overhere
	return(player_lives)
