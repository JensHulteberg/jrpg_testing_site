extends Sprite

func _ready():
	hide()

func explode(location = Vector2(0, 0)):
	position = location
	show()
	$AnimationPlayer.play("explosion")
	yield($AnimationPlayer, "animation_finished")
	hide()
