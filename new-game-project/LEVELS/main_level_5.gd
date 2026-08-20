extends Node2D
var happy_npcs: int = 0
var level_finished: bool = false

func npc_became_happy() -> void:
	if level_finished:
		return
	
	happy_npcs += 1
	
	if happy_npcs >= 9:
		level_finished = true
		
		print("ALL NPCS ARE HAPPY - LEVEL COMPLETE!")
	
		await get_tree().create_timer(1.0).timeout
	
		get_tree().change_scene_to_file("res://finished.tscn")
