extends Node2D

func _ready():
	hide()

#func _process(delta):
#	pass

func warn():
	show()
	$color/AnimationPlayer.play("flash")
