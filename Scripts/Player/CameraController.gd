class_name CameraController extends Node3D

var camera: Camera3D
var pitch: float = 0.0
var yaw: float = 0.0
var max_pitch: float = 80.0

@export var sensitivity: float = 0.003

func _ready() -> void:
	initialize_camera()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func initialize_camera() -> void:
	var child_nodes = get_children()
	if child_nodes.size() > 0:
		for child in child_nodes:
			if child is Camera3D:
				camera = child
	else:
		append_new_camera()
		
func append_new_camera():
	camera = Camera3D.new()
	add_child(camera)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		handle_camera_movement(event)

func handle_camera_movement(mouse_motion: InputEventMouseMotion) -> void:
	yaw -= mouse_motion.relative.x * sensitivity
	pitch -= mouse_motion.relative.y * sensitivity
	
	pitch = clamp(pitch, deg_to_rad(-max_pitch), deg_to_rad(max_pitch))
	
	self.rotation.y = yaw
	camera.rotation.x = pitch
