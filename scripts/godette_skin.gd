extends Node3D

@onready var move_fsm = $AnimationTree.get("parameters/playback")

func set_move_state(name: String) -> void:
	move_fsm.travel(name)
