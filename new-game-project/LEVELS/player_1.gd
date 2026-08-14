extends CharacterBody2D

@export var speed = 200.0
@export var jump_velocity = -500.0

var gravity: float = 900.0

var throw_scene = preload("res://Throw.tscn")

func _physics_process(delta: float) -> void:
	
	#graviy
	if not is_on_floor():
		velocity.y += gravity * delta
		
	#Jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity
		
	#left/Right
	var direction := Input.get_axis("Move Right", "Move Left")
	
	if direction != 0:
		velocity.x = direction * speed
		$AnimatedSprite2D.play("walk") #it plays the walk animation only
		
		if direction > 0:
			$AnimatedSprite2D.flip_h = true #it flips the walk animation on the opisite side
		else:
			$AnimatedSprite2D.flip_h = false #it flips the the hand on the opisite side
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		$AnimatedSprite2D.play("standing")
		
	#Throw
	if Input.is_action_just_pressed("Throw"):
		throw_object()
		
	move_and_slide()

func throw_object() -> void:
	var projectile = throw_scene.instantiate()
	get_parent().add_child(projectile)
	
	projectile.global_position = $ThrowPoint.global_position
	
	var throw_direction: float = -1.0
	if $AnimatedSprite2D.flip_h:
		throw_direction = 1.0
		
	projectile.setup(throw_direction)
