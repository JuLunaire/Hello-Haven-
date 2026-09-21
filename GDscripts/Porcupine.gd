class_name Player extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -1000.0
var spawn_position : Vector2

@onready var animated_sprite = $AnimatedSprite2D

@export var Border_status: int = -1

func _process(_delta) -> void:
	if Input.is_action_pressed("Go_Left") || Input.is_action_pressed("Go_Right"):
		animated_sprite.play("move")
	else:
		animated_sprite.play("idle")

	
func _ready() -> void:
	spawn_position = global_position
	EventController.connect("Border_Crossed", on_event_Border_Crossed)
	
func on_event_Border_Crossed(value:int)->void:
	global_position = spawn_position
	velocity.y = 0
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta 

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Active falling
	if Input.is_action_pressed("Drop") and not is_on_floor():
		velocity += get_gravity() * delta * 2
	# Out of bounds respawn
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Go_Left", "Go_Right")
	if direction !=0:
		velocity.x = direction * SPEED
		if direction < 0:
			animated_sprite.flip_h = true
		elif direction > 0:
			animated_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
