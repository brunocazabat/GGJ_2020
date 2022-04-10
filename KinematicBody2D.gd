extends KinematicBody2D

signal coli
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var direction = Vector2()

const TOP = Vector2(0, -1)
const RIGHT = Vector2(1, 0)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
var velocity = Vector2()
var speeed = Vector2()
var speed = 60

var facing = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var is_moving = Input.is_key_pressed(KEY_Z) or Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_Q)
	#var is_power = Input.is_key_pressed(KEY_SPACE)
	velocity = Vector2()
	if is_moving:
		if Input.is_key_pressed(KEY_Z):
			$AnimatedSprite.animation = "runUp"
			velocity = TOP
			facing = 3
		elif Input.is_key_pressed(KEY_D):
			$AnimatedSprite.animation = "runRight"
			velocity = RIGHT
			facing = 2
		elif Input.is_key_pressed(KEY_S):
			$AnimatedSprite.animation = "runDown"
			velocity = DOWN
			facing = 0
		elif Input.is_key_pressed(KEY_Q):
			$AnimatedSprite.animation = "runLeft"
			velocity = LEFT
			facing = 1
	else:
		if facing == 3:
			$AnimatedSprite.animation = "idleUp"
		if facing == 0:
			$AnimatedSprite.animation = "idleDown"
		if facing == 2:
			$AnimatedSprite.animation = "idleRight"
		if facing == 1:
			$AnimatedSprite.animation = "idleLeft"
		
	if velocity.length() > 0:
		speeed = velocity.normalized() * speed
	else:
		speeed = velocity.normalized() * speed
		get_node("./Walking").play()
		
	#elif is_power:
	#	if direction == TOP:
	#		$AnimatedSprite.animation = "powerUp"
	#	if direction == RIGHT:
	#		$AnimatedSprite.animation = "powerRight"
	#	if direction == DOWN:
	#		$AnimatedSprite.animation = "powerDown"
	#	if direction == LEFT:
	#		$AnimatedSprite.animation = "powerLeft"
	move_and_slide(speeed)

	for i in get_slide_count():
		var coli = get_slide_collision(i)
		if coli:
			emit_signal("coli", coli)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

