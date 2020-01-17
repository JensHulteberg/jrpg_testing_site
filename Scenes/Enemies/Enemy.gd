extends Node2D

var globals

signal done

func _ready():
	globals = get_node("/root/global")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
