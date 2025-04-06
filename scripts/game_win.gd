extends Node3D

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_restart"):
		print("RESTART")
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	
