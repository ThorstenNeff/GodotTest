extends CharacterBody3D
@onready var camera_mount = $CameraMount
@onready var animation_player = $AuxScene/AnimationPlayer
@onready var aux_scene = $AuxScene
@onready var input_gatherer = $InputGatherer
@onready var player_coordinator = $PlayerCoordinator

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x))
		aux_scene.rotate_y(deg_to_rad(event.relative.x))
		camera_mount.rotate_x(deg_to_rad(event.relative.y))
		camera_mount.rotation.x = clamp(camera_mount.rotation.x, deg_to_rad(-45), deg_to_rad(45))

func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func _physics_process(delta):
	var input = input_gatherer.gather_input()
	player_coordinator.update(input, delta)
	# to prevent memory leak
	input.queue_free()
