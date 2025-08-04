class_name Player extends CharacterBody3D

@export var speed = 5.0
@export var jump_velocity = 4.5

var input_direction = Vector2.ZERO


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")


func move(speed: float, acceleration: float, delta: float) -> void:
	var direction := (transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
