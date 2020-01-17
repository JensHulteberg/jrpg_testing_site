extends Node2D

signal done

func _ready():
	pass # Replace with function body.

func act():
	$Menu.toggle()
	print("Player acting")
	yield($Menu, "done")
	emit_signal("done")
