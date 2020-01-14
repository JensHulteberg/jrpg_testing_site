extends Node2D

var talker
var actors
var current_turn = 0

func _ready():
	actors = $"../Actors".get_children()
	for actor in actors:
		actor.connect("done", self, "_on_actor_finished")
	talk(["Battle start!"])

func _process(delta):
	pass

func talk(thing_to_say):
	talker = preload("res://Scenes/Talker/Talker.tscn").instance()
	talker.init(thing_to_say)
	add_child(talker)
	talker.connect("done_talking", self, "_on_done_talking")

func _on_done_talking():
	next_step()

func _on_actor_finished():
	next_step()

func next_step():
	current_turn += 1
	if current_turn > actors.size() - 1:
		current_turn = 0
	actors[current_turn].act()