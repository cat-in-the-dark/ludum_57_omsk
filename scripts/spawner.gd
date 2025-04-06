extends Node3D
class_name Spawner

@export var bullet_scene: PackedScene
@export var pattern = 0
@export var n_bulets = 1
@export var bullets_root: Node3D

var spawned_bullets = 0

func spawn_bullet():
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.pattern = pattern
	bullets_root.add_child(bullet)
	bullet.global_position = global_position

func _on_timer_timeout():
	if spawned_bullets >= n_bulets:
		return
	spawn_bullet()
	spawned_bullets += 1
	if spawned_bullets >= n_bulets:
		queue_free()
