extends Node3D
class_name PlayerCoordinator

@onready var player = $".."
@onready var animation_player = $"../AuxScene/AnimationPlayer"
@onready var combat = $Combat
@onready var active_weapon: Weapon = $"../BoneAttachment3D/WeaponSocket/Pole"

@onready var moves = {
	"idle" : $States/Idle, 
	"walk" : $States/Walk,
	"sprint" : $States/Sprint,
	"jump" : $States/Jump,
	"slash_1" : $States/Slash1
}

var current_move : Move 

func _ready():
	current_move = moves["walk"]
	for move in moves.values():
		move.player = player

func update(input : InputPackage, delta : float):
	input = combat.translate_combat_actions(input)
	var relevance = current_move.check_relevance(input)
	if relevance != "okay":
		switch_to(relevance)
	#
	current_move.update(input, delta)

func switch_to(state: String):
	if current_move != moves[state]:
		#print("Switch to ", state)
		current_move.on_exit_state()
		current_move = moves[state]
		current_move.on_enter_state()
		current_move.mark_enter_state()
		animation_player.play(current_move.animation)
		#print("play ", current_move.animation)


