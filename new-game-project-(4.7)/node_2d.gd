extends Node2D

func _ready() -> void:
	# Check if a character was selected in the global singleton
	if Global.selected_character_scene != "":
		# Load and instantiate the chosen character scene
		var char_resource = load(Global.selected_character_scene)
		var player_instance = char_resource.instantiate()
		
		# Add it to the level and place it at the SpawnPoint position
		add_child(player_instance)
		player_instance.global_position = $SpawnPoint.global_position
	else:
		print("No character selected!")
