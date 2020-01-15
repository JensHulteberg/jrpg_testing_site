extends Node2D

var talker

signal done

func _ready():
	pass

func talk(thing_to_say):
	talker = preload("res://Scenes/Talker/Talker.tscn").instance()
	talker.init(thing_to_say)
	add_child(talker)
	talker.connect("done_talking", self, "_on_done_talking")

func act():
	var animation_player = $AnimationPlayer
	animation_player.play("Attack")
	yield(animation_player, "animation_finished")
	
	talk(["I am the Blue Deamon. Fear me!", "I am done!", "DU är en bajskorv!"])
	yield(talker, "done_talking")
	
	emit_signal("done")

func _on_done_talking():
	pass