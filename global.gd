extends Node

var talker
var active_node
var player_hp

signal done_talking

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	player_hp = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_talker(thing_to_say = "PLACEHOLDER"):
	talker = preload("res://Scenes/Talker/Talker.tscn").instance()
	talker.init(thing_to_say)
	add_child(talker)
	yield(talker, "done_talking")
	emit_signal("done_talking")
	