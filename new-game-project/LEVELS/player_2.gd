extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hand = $hand
@onready var object_marker: Marker2D = $ObjectMarker

var held_card = null

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Animations
	if not is_on_floor():
		animated_sprite.play("jump")
	elif direction != 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("standing")
		
	move_and_slide()
var possiblePickupObjects = []
var currentObject
func _input(event:InputEvent) -> void:
	if Input.is_action_just_pressed("interaction") and currentObject:
		throw_object()
	elif Input.is_action_just_pressed("interaction") and possiblePickupObject:
		pickup_object()

func throw_object():
	
func pickup_object():
	currentObject.reparent(get_tree().current_scene)

	var throwDirection = global_position.direction_to(object_marker.global_position)
	currentObject.throw(throwDirection)
	
	currentObject = null
	
		
func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body is GameObject:
		possiblePickupObjects.append(body)

func _on_pickup_area_body_exited(body: Node2D) -> void:
	if body is GameObject:
		possiblePickupObjects.erase(body)
	
