extends CharacterBody2D

var is_happy: bool = false

func  make_happy() -> void:
	if is_happy:
		return
	
	is_happy = true
	$AnimatedSprite2D.play("happy")
