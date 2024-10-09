extends Node
class_name InputGatherer

func gather_input():
	var new_input = InputPackage.new()
	new_input.input_direction = Input.get_vector("move left", "move right", "move_forward", "move backward")
	if (new_input.input_direction != Vector2.ZERO):
		if  Input.is_action_pressed("sprint"):
			new_input.actions.append("sprint")
		else:
			new_input.actions.append("walk")
			
	if Input.is_action_just_pressed("jump"):
		if  Input.is_action_pressed("sprint"):
			new_input.actions.append("jump") #irgendwann jump sprint hier
		else:
			new_input.actions.append("jump")
	
	if Input.is_action_just_pressed("attack1"):
		new_input.combat_actions.append("light_attack_pressed")
	
	if new_input.actions.is_empty():
		new_input.actions.append("idle")
	
	#print(new_input.actions, ", ", new_input.input_direction)
	return new_input
