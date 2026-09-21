class_name Player extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -1000.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Active falling
	if Input.is_action_pressed("Drop") and not is_on_floor():
		velocity.y = move_toward(velocity.y, 1000, SPEED)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Go_Left", "Go_Right")
	if direction !=0:
		velocity.x = direction * SPEED
		if direction < 0:
			$Sprite2D.flip_h = true
		elif direction > 0:
			$Sprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _ready() -> void:
	$Label.text = "I'm a Strawberry-meter" #Strawberry
