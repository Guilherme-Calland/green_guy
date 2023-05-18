extends Node2D

export var speed = 100
var motion = Vector2(0,0)

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Body/Sprite
var animation = load("res://scripts/green_guy/animation.gd").new()

func run():
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = speed
		animation.turnRight(sprite)
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		animation.turnLeft(sprite)
		motion.x = -speed
	else:
		motion.x = 0
	
	if motion.x != 0:
		animationPlayer.playback_speed = 1.5
	else:
		animationPlayer.playback_speed = 1
	
	$Body.move_and_slide(motion, Vector2(0,-1))
	$Shadow.global_position.x = $Body.global_position.x
