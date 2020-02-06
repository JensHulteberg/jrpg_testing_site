extends Node2D

signal done

func _ready():
	pass # Replace with function body.

func act():
	$Menu.toggle()
	yield($Menu, "done")
	emit_signal("done")
