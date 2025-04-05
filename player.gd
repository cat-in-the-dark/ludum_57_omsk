extends CharacterBody3D

@export var player_id: String = "-1"
@export var speed = 7

@onready var move_left = "move_left_" + player_id
@onready var move_right = "move_right_" + player_id
@onready var move_forward = "move_forward_" + player_id
@onready var move_back = "move_back_" + player_id

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Input.get_vector(move_left, move_right, move_forward, move_back)
	if direction.length() > 0.001:
		print(player_id, direction)

	target_velocity.z = direction.y * speed
	target_velocity.x = direction.x * speed
	
	velocity = target_velocity
	move_and_slide()
