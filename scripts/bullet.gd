extends Node3D
class_name Bullet

@onready var tentacle: Node3D = get_tree().get_nodes_in_group("tentacle")[0]
var is_enemy: bool = true

func fly_to_player(delta: float):
	var dir = Vector3.ZERO
	dir.z = 5 * delta
	translate(dir)
	
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
