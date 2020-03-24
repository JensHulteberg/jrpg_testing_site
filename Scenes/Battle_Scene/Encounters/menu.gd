extends Node2D

signal done

func _ready():
	disable()

func enable():
	visible = true
	for child in get_children():
		child.enable()

func disable():
	visible = false
	for child in get_children():
		child.disable()

