extends Node
class_name Move

@onready var animation_player = $AuxScene/AnimationPlayer
#@onready var aux_scene = $AuxScene
@onready var aux_scene = $"../../../AuxScene"
@onready var camera_mount = $CameraMount

var player : CharacterBody3D
var animation : String
var move_name : String
var has_queued_move : bool = false
var queued_move : String = "none, drop error please"

var enter_state_time : float

static var moves_priority = {
	"idle" : 1,
	"walk" : 2,
	"sprint" : 3,
	"jump" : 10,
	"mid_air" : 10,
	"landing_walk" : 10,
	"jump_sprint" : 10,
	"landing sprint" : 10,
	# "slash_1" : 15,
	# "slash_2" : 15,
	# "slash_3" : 15
}

static func moves_priority_sort(a : String, b : String):
	if moves_priority[a] > moves_priority[b]:
		return true
	else:
		return false

func check_relevance(input : InputPackage) -> String:
	print_debug("error, implement the check_relevance function on your state")
	return "error, implement the check_relevance function on your state"	

func update(input : InputPackage, delta : float):
	pass	

func on_enter_state():
	pass

func on_exit_state():
	pass

func mark_enter_state():
	var now = Time.get_unix_time_from_system()
	return now - enter_state_time

func get_progress() -> float:
	var now = Time.get_unix_time_from_system()
	return now - enter_state_time

func works_longer_than(time : float) -> bool:
	if get_progress() >= time:
		return true
	return false

func works_less_than(time : float) -> bool:
	if get_progress() >= time:
		return true
	return false

