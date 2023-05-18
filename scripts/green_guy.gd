extends Node2D

export var speed = 100
var motion = Vector2(0,0)

onready var animationPlayer = $Body/Animation/AnimationPlayer
onready var sprite = $Body/Animation/Sprite

func run():
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = speed
		sprite.flip_h = false
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		sprite.flip_h = true
		motion.x = -speed
	else:
		motion.x = 0
	
	if motion.x != 0:
		animationPlayer.playback_speed = 1.5
	else:
		animationPlayer.playback_speed = 1
	
	$Body.move_and_slide(motion, Vector2(0,-1))
	$Shadow.global_position.x = $Body.global_position.x
