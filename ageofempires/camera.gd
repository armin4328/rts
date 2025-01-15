extends Camera2D

var velocity = Vector2.ZERO
var speed = 200

func _process(delta):
	position += velocity * delta

func _input(event):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("w"):
		velocity.y = -speed
	if Input.is_action_pressed("a"):
		velocity.x = -speed
	if Input.is_action_pressed("s"):
		velocity.y = speed
	if Input.is_action_pressed("d"):
		velocity.x = speed
