extends Node2D

var talker
var actors
var current_turn = 0

var globals

signal enemy_attacking
signal enemy_done_attacking

func _ready():
	
	actors = $"../Actors".get_children()
	for actor in actors:
		actor.connect("done", self, "_on_actor_finished")
		if actor.is_in_group("player"):
			print("Is this happening?")
			connect("enemy_attacking", actor, "_on_enemy_attacking")
			connect("enemy_done_attacking", actor, "_on_enemy_done_attacking")
	global.get_talker(["Battle start!"])
	yield(global, "done_talking")
	next_step()

func _process(delta):
	pass

func _on_actor_finished():
	emit_signal("enemy_done_attacking")
	next_step()

func next_step():
	current_turn += 1
	if current_turn > actors.size() - 1:
		current_turn = 0
	if actors[current_turn].is_in_group("Enemy"):
		emit_signal("enemy_attacking")
	actors[current_turn].act()
	print("It is: " + actors[current_turn].name + "s turn!")