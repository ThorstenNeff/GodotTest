extends Move
class_name Slash1
#attack emitter


const COMBO_TIMING = 1.12
const TRANSITION_TIMING = 1.4
const ATTACK_TIMING = 0.5
var did_damage = false

func _ready():
	animation = "StandingMeleeAttackBackhandskel"
	move_name = "slash1"


func check_relevance(input : InputPackage):
	#check_combos(input)
	if works_longer_than(ATTACK_TIMING) and did_damage == false:
		did_damage = true
		#attack_emitter.fire()
	
	if works_longer_than(COMBO_TIMING) and has_queued_move:
		has_queued_move = false
		return queued_move
	elif works_longer_than(TRANSITION_TIMING):
		input.actions.sort_custom(moves_priority_sort)
		return input.actions[0]
	else:
		return "okay"

func on_enter_state():
	player.velocity = Vector3.ZERO
	did_damage = false
