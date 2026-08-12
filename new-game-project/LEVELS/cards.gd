extends CharacterBody2D
class_name GameObject

@export var throwForce = Vector2(150, -300)

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		velocity.x = move_toward(velocity.x, 0, 600 * delta)
		velocity.y = 0
		
	move_and_slide()

@onready var sprite2d: Sprite2D = $Sprite2D
