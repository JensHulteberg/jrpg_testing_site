extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var globals

signal done

# Called when the node enters the scene tree for the first time.
func _ready():
	globals = get_node("/root/global")

func act():
	globals.get_talker(["Hello?"])
	yield(globals, "done_talking")
	emit_signal("done")
