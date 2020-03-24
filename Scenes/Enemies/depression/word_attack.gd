extends Node2D

export (float) var speed_down = 1
export (float) var distance_goal = 100
export (String) var word = "PLACEHOLDER"
var distance_traveled = 0

func _ready():
	$Projectile/Label.text = word
	$Projectile.position = Vector2(0, -distance_goal)
	$Danger_square.warn()


func _process(delta):
	if distance_traveled < distance_goal:
		$Projectile.translate(Vector2(0, speed_down))
		distance_traveled += speed_down
	else:
		explode(word)
		set_process(false)
		$Projectile/Label.hide()
		$Danger_square.hide()


func explode(word_to_explode):
	$Projectile/Explosion_blue.explode()
	$Projectile/word_explosion.explode_word(word)
	yield($Projectile/word_explosion, "done")
	queue_free()
