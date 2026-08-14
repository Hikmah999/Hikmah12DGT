extends Area2D

var velocity: Vector2 = Vector2.ZERO

func setup(direction: float) -> void:
	velocity = Vector2(500.0 * direction, -100.0)

func _physics_process(delta: float) -> void:
	global_position += velocity * delta
