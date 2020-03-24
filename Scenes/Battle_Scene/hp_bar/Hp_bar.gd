extends Node2D

var goal_hp
var prev_hp

func _ready():
	prev_hp = global.player_hp
	$HP.text = str(global.player_hp) + "/" + str(global.player_max_hp)

func _process(delta):
	update_hp()

func update_hp():
	goal_hp = global.player_hp
	if goal_hp != prev_hp:
		if goal_hp > prev_hp:
			prev_hp += 1
		elif goal_hp < prev_hp:
			prev_hp -= 1
		$HP.text = str(prev_hp) + "/" + str(global.player_max_hp)
		
	elif goal_hp == prev_hp:
		prev_hp = global.player_hp
