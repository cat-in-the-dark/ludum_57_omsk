extends Area3D
class_name TentacleArea

@onready var anim_player: AnimationPlayer = $"../AnimationPlayer"

func damage():
	print("yamete kudasay")
	if anim_player.current_animation != "damaged":
		anim_player.play("damaged")
