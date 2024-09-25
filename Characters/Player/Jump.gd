extends Move
class_name Jump

const VERTICAL_SPEED_ADDED = 2.5

const TRANSITION_TIMING = 0.44
const JUMP_TIMING = 0.1

var jumped = false

func _ready():
	animation = "Jumpskel"
	move_name = "jump"

func check_relevance(input):
	if works_longer_than(TRANSITION_TIMING):
		player.velocity.y -= VERTICAL_SPEED_ADDED
		if player.is_on_floor():
			jumped = false
			return "idle"
	return "okay"

func update(input, delta):
	#if works_longer_than(JUMP_TIMING):
	if not jumped:
		player.velocity.y += VERTICAL_SPEED_ADDED
		jumped = true
	player.move_and_slide()

func on_exit_state():
	print("on exit state")

