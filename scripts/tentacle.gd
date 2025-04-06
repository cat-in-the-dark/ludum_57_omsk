extends Node3D

@export var spawner_scene: PackedScene
@export var bullet_scene: PackedScene

func _on_spawn():
	print("spawn pattern")
	var spawner: Spawner = spawner_scene.instantiate()
	spawner.position = Vector3((randf() - 0.5) * 8 * 2, 0.5, 2)
	spawner.bullet_scene = bullet_scene
	spawner.n_bulets = randi_range(2, 4)
	spawner.pattern = randi_range(0, 1)
	add_child(spawner)
