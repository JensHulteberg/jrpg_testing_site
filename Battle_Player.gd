extends Node2D

signal done

func _ready():
	pass # Replace with function body.

func act():
	$Menu.toggle()
	yield($Menu, "done")
	emit_signal("done")

func _on_enemy_attacking():
	print("Hello from enemy attacking!!!")
	$Battle_player_sprite.set_process(true)

func _on_enemy_done_attacking():
	$Battle_player_sprite.set_process(false)
