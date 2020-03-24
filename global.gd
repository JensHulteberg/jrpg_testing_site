extends Node

var talker
var active_node
var player_hp
var player_max_hp
var disable_player

signal done_talking

func _ready():
	player_hp = 100
	player_max_hp = 100
	disable_player = false

func get_talker(thing_to_say = "PLACEHOLDER"):
	talker = preload("res://Scenes/Talker/Talker.tscn").instance()
	talker.init(thing_to_say)
	add_child(talker)
	disable_player = true
	yield(talker, "done_talking")
	disable_player = false
	emit_signal("done_talking")

func get_auto_talker(thing_to_say = "PLACEHOLDER"):
	talker = preload("res://Scenes/Talker/Talker.tscn").instance()
	talker.auto_text = true
	talker.init(thing_to_say)
	add_child(talker)
	yield(talker, "done_talking")
	emit_signal("done_talking")

func pause_game():
	get_tree().paused = !get_tree().paused
