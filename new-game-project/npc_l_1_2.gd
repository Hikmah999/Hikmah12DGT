extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	# Starts the NPC with your sad animation loop
	animated_sprite.play("sad npc aniamtion")

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	move_and_slide()

# Call this function from your card/interaction script to trigger the change
func become_happy() -> void:
	animated_sprite.play("happy npcs image")
