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

func check_relevance(input):
	if works_longer_than(TRANSITION_TIMING):
		if not player.is_on_floor():
			return "okay"
		else:
			# if player is jumping, are they moving horizontally
			var xz_velocity = player.velocity
			xz_velocity.y = 0
			if xz_velocity.length_squared() >= 10:
				return "walk"
			if xz_velocity.length_squared() <= 1:
				return "idle"
		return "walk"
		
	else:
		return"okay"

func update(input, delta):
	if works_longer_than(JUMP_TIMING) and works_less_than(TRANSITION_TIMING):
		if not jumped:
			player.velocity.y += VERTICAL_SPEED_ADDED
			jumped = true
	elif works_longer_than(TRANSITION_TIMING):
		if not player.is_on_floor():
			player.velocity.y -= gravity * delta
		else:
			player.velocity.y = 0
			jumped = false
	player.move_and_slide()

func on_exit_state():
	player.velocity.y = 0
	jumped = false
	print("on exit state")

