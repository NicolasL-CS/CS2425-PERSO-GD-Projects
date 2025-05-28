extends Node2D

# Creates a reference to the parent object 'Brick'
@onready var brickObject = preload("res://Scenes/brick.tscn")
# Creates bricks array settings
var columns = 32
var rows = 7
var margin = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupLevel()

# Creates the brick array, adding randomness
func setupLevel():
	# Sets the bricks rows increment on each level
	rows = 2 + GameManager.player_level
	if rows > 9:
		rows = 9
	# Sets bricks colors
	var colors = getColors()
	colors.shuffle()
	# Loops inside each column, then in each row and creates brick instance
	for r in rows:
		for c in columns:
			var randomNumber = randi_range(0,2)
			if randomNumber > 0:
				var newBrick = brickObject.instantiate()
				add_child(newBrick)
				newBrick.position = Vector2(margin + (34 * c), margin + (34 * r))
				#Enters into component 'Sprite2D' of the created instance and sets its color
				if r <= 9:
					newBrick.get_node('Sprite2D').modulate = colors[0]
				if r < 6:
					newBrick.get_node('Sprite2D').modulate = colors[1]
				if r < 3:
					newBrick.get_node('Sprite2D').modulate = colors[2]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
# Creates an array of colors
func getColors():
	var colors = [
		Color(0,1,1,1),
		Color(0.54,0.17,0.89,1),
		Color(0.68,1,0.18,1),
		Color(1,1,1,1)
		]
	return colors
