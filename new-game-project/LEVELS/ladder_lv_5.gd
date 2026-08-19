extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player1":
		body.on_ladder = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player1":
		body.on_ladder = false
