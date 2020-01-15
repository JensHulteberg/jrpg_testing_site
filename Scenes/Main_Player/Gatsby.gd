extends KinematicBody2D

enum facedir_enum{
	UP,
	DOWN,
	LEFT,
	RIGHT,
	DEFAULT
	}
	
var facedir
var animation_player
var raycast
var interactable = null
var occupied = false

export (int) var speed = 60
var raycast_range = 30


#warning-ignore-all:RETURN_VALUE_DISCARDED
#warning-ignore-all:UNUSED_ARGUMENT 
func _ready():
	animation_player = $AnimationPlayer
	raycast = $RayCast2D

var velocity = Vector2()

func get_input():
	if !occupied:
		velocity = Vector2()
		if Input.is_action_pressed('ui_right'):
			velocity.x += 1
		if Input.is_action_pressed('ui_left'):
			velocity.x -= 1
		if Input.is_action_pressed('ui_down'):
			velocity.y += 1
		if Input.is_action_pressed('ui_up'):
			velocity.y -= 1
		velocity = velocity.normalized() * speed

func interact():
	if !occupied:
		if Input.is_action_just_pressed("ui_accept"):
			interactable = raycast.get_collider()
			if interactable != null:
				if interactable.has_method("act"):
					occupied = true
					interactable.act()
					yield(interactable, "done")
					occupied = false
				else:
					print(interactable.name + " has no act function")

func raycast_dir():
	if facedir == facedir_enum.LEFT:
		raycast.set_cast_to(Vector2(raycast_range, 0))
	elif facedir == facedir_enum.RIGHT:
		raycast.set_cast_to(Vector2(-raycast_range, 0))
	elif facedir == facedir_enum.DOWN:
		raycast.set_cast_to(Vector2(0, raycast_range))
	elif facedir == facedir_enum.UP:
		raycast.set_cast_to(Vector2(0, -raycast_range))

func animate():
	if velocity.x > 0:
		animation_player.set_current_animation("walk_side")
		$Sprite.flip_h = false
		facedir = facedir_enum.LEFT
	elif velocity.x < 0:
		animation_player.set_current_animation("walk_side")
		$Sprite.flip_h = true
		facedir = facedir_enum.RIGHT
	elif velocity.y > 0:
		animation_player.set_current_animation("walk_down")
		facedir = facedir_enum.DOWN
	elif velocity.y < 0:
		animation_player.set_current_animation("walk_up")
		facedir = facedir_enum.UP
	else:
		if facedir == facedir_enum.LEFT:
			animation_player.set_current_animation("idle_side")
			$Sprite.flip_h = false
		elif facedir == facedir_enum.RIGHT:
			animation_player.set_current_animation("idle_side")
			$Sprite.flip_h = true
		elif facedir == facedir_enum.DOWN:
			animation_player.set_current_animation("idle_down")
		elif facedir == facedir_enum.UP:
			animation_player.set_current_animation("idle_up")

func _physics_process(delta):
	get_input()
	raycast_dir()
	animate()
	interact()
	move_and_slide(velocity)