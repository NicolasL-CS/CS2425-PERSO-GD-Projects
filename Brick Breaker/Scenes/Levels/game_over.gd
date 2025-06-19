extends Node2D

# Code to add to the button pressed
	# var game = preload ("res://Scenes/Levels/level_main.tscn")
	# get_tree().get_root().add_child(game)


func _ready():
	$Control/MarginContainer/ColorRect/Button.connect("pressed", Callable(self, "_on_restart_pressed"))

func _on_restart_pressed():
	GameManager.reset_game_variables()
	get_tree().change_scene_to_file("res://Scenes/Levels/level_main.tscn")
