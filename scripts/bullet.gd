extends Node3D
class_name Bullet

@export var pattern: int = 0 
@onready var tentacle: Node3D = get_tree().get_nodes_in_group("tentacle")[0]
var is_enemy: bool = true
var accum_time = 0

func setup_random_blink():
	var blink_timer: SceneTreeTimer = get_tree().create_timer(randf_range(1, 3))
	blink_timer.timeout.connect(on_random_blink, CONNECT_ONE_SHOT)

func on_random_blink():
	if not is_enemy:
		return
	print('BLINK')
	setup_random_blink()
	var dir = Vector3((randf()-0.5) * 8, 0, -5 * randf())
	translate(dir)

func _ready():
	if pattern == 2:
		setup_random_blink()

func move_fn_sin() -> Vector3:
	var dir = Vector3.ZERO
	dir.z = 3
	dir.x = sin(accum_time*2) * 5
	return dir

func move_fn_linear() -> Vector3:
	var dir = Vector3.ZERO
	dir.z = 6
	return dir

func move_random_blink() -> Vector3:
	return move_fn_linear()

var functions = [move_fn_sin, move_fn_linear, move_random_blink]

func fly_to_player(delta: float):
	accum_time += delta
	var dir = functions[pattern].call()
	translate(dir * delta)
	
func fly_to_tentacle(delta: float):
	var dir = position.direction_to(tentacle.position)
	translate(dir * delta * 10)
	
func _on_bullet_area_entered(area_rid, area, area_shape_index, local_shape_index):
	if is_enemy:
		is_enemy = false
		print('BUM')
	

func _physics_process(delta: float):
	if is_enemy:
		fly_to_player(delta)
	else:
		fly_to_tentacle(delta)
