extends Move
class_name Sprint

const SPEED = 5.0

func _ready():
	animation = "RunForwardskel"

func check_relevance(input : InputPackage):
	#if not player.is_on_floor():
	#	return "mid_air"
	
	input.actions.sort_custom(moves_priority_sort)
	if input.actions[0] == "sprint":
		return "okay"
	return input.actions[0]
	
func update(input : InputPackage, delta: float):
	var direction = (player.transform.basis * Vector3(input.input_direction.x, 0, input.input_direction.y)).normalized()
	player.velocity.x = direction.x * SPEED
	player.velocity.z = direction.z * SPEED
	#turn char into move direction
	aux_scene.look_at(player.position + direction)
	player.move_and_slide()
	
