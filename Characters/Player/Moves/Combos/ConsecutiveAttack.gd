extends Combo

@export var primary_input : String
@export var next_attack : String


func _ready():
	triggered_move = next_attack


func is_triggered_move(input : InputPackage) -> bool:
	if input.actions.has(primary_input):
		return true
	return false


