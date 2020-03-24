extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal done

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func act():
	global.get_auto_talker(["You are attacking!"])
	yield(global, "done_talking")
	emit_signal("done")
