extends Node2D

var talker
signal done

func _ready():
	pass

func act():
	pass

func talk(thing_to_say):
	talker = preload("res://Scenes/Talker/Talker.tscn").instance()
	talker.init(thing_to_say)
	add_child(talker)

