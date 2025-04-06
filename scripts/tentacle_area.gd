extends Area3D
class_name TentacleArea

var hp = 30
@onready var anim_player: AnimationPlayer = $"../AnimationPlayer"

func damage():
	hp -= 1
	print("yamete kudasay ", hp)
	if anim_player.current_animation != "damaged":
		anim_player.play("damaged")
