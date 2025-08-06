class_name Player extends CharacterBody3D

@export var speed = 5.0
@export var jump_velocity = 4.5

var input_direction = Vector2.ZERO
@onready var state_machine = $StateMachine
@onready var player_skin = $PlayerSkin
@onready var camera_controller = $CameraController

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	
func move() -> void:
	var camera_yaw = camera_controller.yaw
	var camera_basis = Basis(Vector3.UP, camera_yaw)
	
	var direction := (camera_basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	move_and_slide()
