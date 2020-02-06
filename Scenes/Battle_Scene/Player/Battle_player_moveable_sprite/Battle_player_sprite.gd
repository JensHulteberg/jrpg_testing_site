extends Node2D

var map
var location
var x
var y
export var jump_length = 16

func _ready():
	location = get_position()
	x = location.x
	y = location.y

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		x -= jump_length
	elif Input.is_action_just_pressed("ui_right"):
		x += jump_length
	elif Input.is_action_just_pressed("ui_up"):
		y -= jump_length
	elif Input.is_action_just_pressed("ui_down"):
		y += jump_length
	
	x = clamp(x, location.x, location.x + jump_length*2)
	y = clamp(y, location.y, location.y + jump_length*2)
	
	position.x = x
	position.y = y
	
	
