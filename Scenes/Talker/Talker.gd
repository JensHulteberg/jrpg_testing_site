extends Node

var text
var current_index = 0
var text_label

signal done_talking

func init(thing_to_say):
	text = thing_to_say

func _ready():
	#init()
	text_label = $Node2D/RichTextLabel
	text_label.visible_characters = 0
	text_label.text = text[0]
	

func _process(delta):
	if text_label.visible_characters <= text[current_index].length():
		text_label.visible_characters += 1
	if Input.is_action_just_pressed("ui_accept"):
		proceed_text()

func proceed_text():
	current_index += 1
	if current_index <= text.size() - 1:
		text_label.visible_characters = 0
		text_label.text = text[current_index]
	else:
		emit_signal("done_talking")
		queue_free()
	
