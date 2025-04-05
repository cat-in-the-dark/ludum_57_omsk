extends CharacterBody3D

@export var player_id: String = "-1"
@export var speed = 7

@onready var move_left = "move_left_" + player_id
@onready var move_right = "move_right_" + player_id
@onready var move_forward = "move_forward_" + player_id
@onready var move_back = "move_back_" + player_id

@onready var skin = $Pivot/GodetteSkin

var target_velocity = Vector3.ZERO

func move(delta):
	var movement_input = Input.get_vector(move_left, move_right, move_forward, move_back)
	var vel_2d = Vector2(velocity.x, velocity.z)
	
	if movement_input.length() > 0.001:
		vel_2d += movement_input * speed * delta * 8
		vel_2d = vel_2d.limit_length(speed)
		skin.set_move_state('Running')
		
		var target_angle = movement_input.angle()
		skin.rotation.y = PI/2 - target_angle
	else:
		vel_2d = vel_2d.move_toward(Vector2.ZERO, speed * 4.0 * delta)
		skin.set_move_state('Idle')

	velocity.x = vel_2d.x
	velocity.z = vel_2d.y
		

func _physics_process(delta):
	move(delta)
	move_and_slide()
