extends Node2D

var options
var selected
var globals

var button_texture = load("res://Assets/button.png")
var button_highlight = load("res://Assets/button_selected.png")

func _ready():
	options = $Buttons.get_children()
	selected = 0
	
	globals = get_node("/root/global")
	globals.active_node = self

func _process(delta):
	detect_input(globals.active_node)
	
	if selected > options.size() - 1:
		selected = 0
	elif selected < 0:
		selected = options.size() -1
	
	highlight_item()

func detect_input(active_node):
	if active_node == self:
		if Input.is_action_just_pressed("ui_right"):
			selected -= 1
		if Input.is_action_just_pressed("ui_left"):
			selected += 1
		if Input.is_action_just_pressed("ui_accept"):
			select_item()

func highlight_item():
	for option in options:
		option.set_texture(button_texture)
	options[selected].set_texture(button_highlight)

func select_item():
	options[selected].act()
	globals.active_node = options[selected]
	set_process(false)
	yield(options[selected], "done")
	set_process(true)
	globals.active_node = self