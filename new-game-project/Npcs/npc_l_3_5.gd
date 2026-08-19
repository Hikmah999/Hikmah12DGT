extends CharacterBody2D

@export var speed: float = 100.0
@export var detection_distance: float = 180.0
@export var move_distance: float = 100.0

var direction: float = 1.0
var start_x: float

@onready var player = get_tree().get_first_node_in_group(player)
func _ready() -> void:
	start_x = global_position.x
func _physics_process(delta: float) -> void:
	if player == null:
		return
	var distance_to_player = global_position.distance_to(player.global_position)
	if distance_to_player <= detection_distance:
		velocity.x = direction * speed
		
		if global_position.x >= start_x + move_distance:
			direction = -1.0
		
		elif global_position.x <= start_x - move_distance:
			direction = 1.0
			
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true	
	else:
		velocity.x = 0
	move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		
		if body != null and body.is_in_group("player_2")
			get_tree().reload_current_scene()
		
var is_happy: bool = false

func  make_happy() -> void:
	if is_happy:
		return
	
	is_happy = true
	$AnimatedSprite2D.play("happy")

	get_tree().current_scene.npc_became_happy()
	
