extends Control

# Assign your character scene paths here
const CHAR_1_PATH = "res://characters/character_one.tscn"
const CHAR_2_PATH = "res://characters/character_two.tscn"

func _on_char_1_button_pressed() -> void:
	Global.selected_character_scene = CHAR_1_PATH
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_char_2_button_pressed() -> void:
	Global.selected_character_scene = CHAR_2_PATH
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_brighteyes_idle_pressed() -> void:
	pass # Replace with function body.

func _on_ShedChicken_idle_pressed() -> void:
	pass # Replace with function body.
