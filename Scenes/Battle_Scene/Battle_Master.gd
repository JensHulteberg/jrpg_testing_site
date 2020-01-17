extends Node2D

var talker
var actors
var current_turn = 0

var globals

func _ready():
	globals = get_node("/root/global")
	
	actors = $"../Actors".get_children()
	for actor in actors:
		actor.connect("done", self, "_on_actor_finished")
	
	globals.get_talker(["Battle start!"])
	yield(globals, "done_talking")
	next_step()

func _process(delta):
	pass

func _on_actor_finished():
	next_step()

func next_step():
	current_turn += 1
	if current_turn > actors.size() - 1:
		current_turn = 0
	actors[current_turn].act()
	print("It is: " + actors[current_turn].name + "s turn!")