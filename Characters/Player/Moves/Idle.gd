extends Move
class_name Idle


func _ready():
	animation = "OrcIdleskel"

func check_relevance(input : InputPackage):
	input.actions.sort_custom(moves_priority_sort)
	return input.actions[0]
	
func on_enter_state():
	player.velocity = Vector3.ZERO
