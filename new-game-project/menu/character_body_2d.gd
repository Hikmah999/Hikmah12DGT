extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play("standing")

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	move_and_slide()
