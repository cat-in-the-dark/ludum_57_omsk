extends CharacterBody3D

@export var player_id: String = "-1"
@export var speed = 14

@onready var move_left = "move_left_" + player_id
@onready var move_right = "move_right_" + player_id
@onready var move_forward = "move_forward_" + player_id
@onready var move_back = "move_back_" + player_id

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var velocity = Input.get_vector(move_left, move_right, move_forward, move_back)
	if velocity.length() > 0.001:
		print(player_id, velocity)

	
