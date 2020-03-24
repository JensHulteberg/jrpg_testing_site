extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal done
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func act():
	global.get_auto_talker(["This is running away!"])
	yield(global, "done_talking")
	emit_signal("done")
