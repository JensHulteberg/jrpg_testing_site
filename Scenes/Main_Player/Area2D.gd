extends Area2D

var object = null

func _on_Area2D_area_entered(area):
	object = area

func _on_Area2D_area_exited(area):
	object = null
