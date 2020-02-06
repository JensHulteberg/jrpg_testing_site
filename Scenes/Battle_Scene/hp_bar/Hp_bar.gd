extends Node2D

var hp_factor

func _ready():
	hp_factor = float(global.player_hp)/100

func _process(delta):
	if global.player_hp < 0:
		hp_factor = 0
	else:
		scale.x = hp_factor
		hp_factor = float(global.player_hp)/100
	
	if Input.is_action_just_pressed("ui_accept"):
		pass