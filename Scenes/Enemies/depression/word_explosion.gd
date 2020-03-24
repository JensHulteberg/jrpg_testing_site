extends Node2D

var word = "Hello world!"
var directions = []

signal done

func _ready():
	set_process(false)
	hide()

func explode_word(word):
	word = word
	for i in word:
		var node = Node2D.new()
		var label = Label.new()
		label.text = i
		node.add_child(label)
		add_child(node)
		
		directions.append(Vector2(rand_range(-1, 1), rand_range(-1, 1)))
	show()
	set_process(true)
	yield(get_tree().create_timer(3.0), "timeout")
	emit_signal("done")

func _process(delta):
	var x = 0
	for node in get_children():
		node.position += directions[x]*3
		x += 1