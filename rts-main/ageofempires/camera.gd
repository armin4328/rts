extends Camera2D

var velocity = Vector2.ZERO
var speed = 200

func _process(delta):
	position += velocity * delta

func _input(event):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("w"):
		velocity.y = -speed
		Global.moving = true

	if Input.is_action_pressed("a"):
		velocity.x = -speed
		Global.moving = true

	if Input.is_action_pressed("s"):
		velocity.y = speed
		Global.moving = true

	if Input.is_action_pressed("d"):
		velocity.x = speed
		Global.moving = true
	
	if velocity.y == 0 and velocity.x == 0:
		Global.moving = false
