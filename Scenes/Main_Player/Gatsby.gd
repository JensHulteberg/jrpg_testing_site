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

export (int) var speed = 60
var raycast_range = 30


#warning-ignore-all:RETURN_VALUE_DISCARDED
#warning-ignore-all:UNUSED_ARGUMENT 
func _ready():
	animation_player = $AnimationPlayer
	raycast = $RayCast2D

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		raycast.set_cast_to(Vector2(raycast_range, 0))
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		raycast.set_cast_to(Vector2(raycast_range, 0))
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

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
	move_and_slide(velocity)
	animate()