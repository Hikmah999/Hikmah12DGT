extends CharacterBody2D

@export var speed: float = 200.0
@export var move_distance: float = 150.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction: float = -1.0
var start_x: float


func _ready():
	start_x = global_position.x
	animated_sprite.play("walk")


func _physics_process(_delta):

	velocity.x = direction * speed

	# Go right after reaching the left limit
	if global_position.x <= start_x - move_distance:
		direction = 1.0

	# Go left after reaching the right limit
	elif global_position.x >= start_x + move_distance:
		direction = -1.0

	# Flip sprite to face movement direction
	if direction > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true

	animated_sprite.play("walk")

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name =="player_2" or body.name =="Player1":
		get_tree().reload_current_scene()
