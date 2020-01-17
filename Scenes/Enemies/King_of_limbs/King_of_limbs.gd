extends "res://Scenes/Enemies/Enemy.gd"

export var hp = 100

func _ready():
	pass

func act():
	global.get_talker(["Help me!"])
	yield(global, "done_talking")
	
	$AnimationPlayer.play("Attack")
	yield($AnimationPlayer, "animation_finished")
	
	globals.player_hp -= 10
	
	emit_signal("done")