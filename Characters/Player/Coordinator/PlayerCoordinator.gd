extends Node3D
@onready var player = $".."
@onready var animation_player = $"../AuxScene/AnimationPlayer"

@onready var moves = {
	"idle" : $States/Idle, "walk" : $States/Walk
	
	#"sprint" : $States/Sprint
}

var current_move : Move 

func _ready():
	current_move = moves["walk"]
	for move in moves.values():
		move.player = player

func update(input : InputPackage, delta : float):
	var relevance = current_move.check_relevance(input)
	if relevance != "okay":
		switch_to(relevance)
	#
	current_move.update(input, delta)

func switch_to(state: String):
	pass


