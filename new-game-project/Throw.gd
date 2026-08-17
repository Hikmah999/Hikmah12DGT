extends Area2D

var velocity: Vector2 = Vector2.ZERO
var fall_gravity: float = 900.0

var start_position: Vector2
var fade_started: bool = false

@export var fade_distance: float = 100.0
@export var fade_speed: float = 1.5
@export var left_border: float = 0.0
@export var right_border: float = 1150.0
@export var top_border: float = 0.0
@export var bottom_border: float = 650

func _ready() -> void:
	start_position = global_position
	
func setup(direction: float) -> void:
	velocity = Vector2(250.0 * direction, -150.0)

func _physics_process(delta: float) -> void:
	velocity.y += fall_gravity * delta  #gravity
	global_position += velocity * delta  #move card
	var distance_travelled = global_position.distance_to(start_position)
	if distance_travelled >= fade_distance:
		fade_started = true
		
	if fade_started:
		modulate.a -= fade_speed * delta
		
		if modulate.a <= 0.0:
			queue_free()



func _on_body_entered(body: Node2D) -> void:
	print("CARD HIT: ", body.name)
	
	if body.is_in_group("npc"):
		if body.has_method("happy"):
			body.make_happy()
			queue_free
