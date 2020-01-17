extends "res://Scenes/Things/Thing.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func act():
	globals.get_talker(["Hello!!!", "What is going on?"])
	yield(globals, "done_talking")
	
	emit_signal("done")

func _process(delta):
	pass
