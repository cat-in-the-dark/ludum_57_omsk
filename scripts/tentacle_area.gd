extends Area3D
class_name TentacleArea

var hp: int = 30
@onready var anim_player: AnimationPlayer = $"../AnimationPlayer"
@onready var tentacle: Tentacle = $".."

func _ready():
	tentacle.ScoreHud.text = "HIS HP: %d" % hp

func damage():
	hp -= 1
	print("yamete kudasay ", hp)
	tentacle.ScoreHud.text = "HIS HP: %d" % hp
	if hp <= 0:
		get_tree().change_scene_to_file("res://scenes/game_win.tscn")
	if anim_player.current_animation != "damaged":
		anim_player.play("damaged")
