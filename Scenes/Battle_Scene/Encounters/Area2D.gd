extends Area2D

signal done

func act():
	yield(get_tree(), "idle_frame")
	print("This is where a button would do something!")

func disable():
	$CollisionShape2D.disabled = true

func enable():
	$CollisionShape2D.disabled = false
