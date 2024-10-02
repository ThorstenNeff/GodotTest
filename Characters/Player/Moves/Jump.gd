extends Move
class_name Jump

const VERTICAL_SPEED_ADDED = 2.5

const TRANSITION_TIMING = 0.44
const JUMP_TIMING = 0.1
var gravity = 10
var jumped = false

func _ready():
	animation = "Jumpskel"
	move_name = "jump"

func on_enter_state():
	print("jump onenterstate")
	
func on_exit_state():
	print("jump onexitstate")
	player.velocity.y = 0
	jumped = false

func check_relevance(input):
	# Go up for <TRANSITION_TIMING> seconds
	if works_longer_than(TRANSITION_TIMING):		
		if not player.is_on_floor():
			print("Player still not on floor")
			return "okay"
		else:
			print("Player back on floor, check where to go")
			var xz_velocity = player.velocity
			xz_velocity.y = 0
			if xz_velocity.length_squared() >= 10:
				return "walk" # TODO: Replace with sprint, Optional: landing_walk
			if xz_velocity.length_squared() <= 1:
				return "idle" # Optional: landing_idle
		return "walk"
		
	else: 
		return "okay"

func update(input, delta):
	if works_longer_than(JUMP_TIMING) and works_less_than(TRANSITION_TIMING):
		if not jumped:
			print("PUSH")
			player.velocity.y += VERTICAL_SPEED_ADDED
			jumped = true
	elif works_longer_than(TRANSITION_TIMING):
		if not player.is_on_floor():
			player.velocity.y -= gravity * delta
		else:
			print("Reset player")
			player.velocity.y = 0
			jumped = false
	player.move_and_slide()
