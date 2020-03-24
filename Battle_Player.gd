extends Node2D

signal done

func _ready():
	pass # Replace with function body.

func act():
	var menu = get_tree().get_root().find_node("Menu", true, false)
	menu.toggle()
	yield(menu, "done")
	emit_signal("done")

func _on_enemy_attacking():
	$Battle_player_sprite.set_process(false)

func _on_enemy_done_attacking():
	$Battle_player_sprite.set_process(false)
