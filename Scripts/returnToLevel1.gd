extends Node2D

func _ready():
	$Label.text = "Final Coins Collected: " + str(Globals.score)

func _on_return_to_level_1_pressed() -> void:
	Globals.reset_data()
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
	
