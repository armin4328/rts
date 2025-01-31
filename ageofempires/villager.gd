extends CharacterBody2D  # Change to your node type (e.g., KinematicBody2D)


@onready var anim = $AnimationPlayer
# Variables for movement
var speed = 100.0  # Movement speed
var destination = Vector2()  # Target position
var is_moving = false  # Whether the villager is moving

func _ready():
	# Set an initial destination (optional)
	destination = position
	is_moving = false

func _process(delta):
	if is_moving:
		move_to_destination(delta)
		if velocity.x > 0:
			anim.play("right")
		elif velocity.x < 0:
			anim.play("left")
	else:
		anim.play("idle")

# Function to command the villager to move to a specific position
func move_to(new_destination: Vector2):
	destination = new_destination
	is_moving = true

# Move towards the destination
func move_to_destination(delta):
	# Check if we've reached the destination
	if position.distance_to(destination) <= 20:  # Adjust the tolerance as needed
		is_moving = false
		return

	# Move towards the destination
	var direction = (destination - position).normalized()
	velocity = direction * speed
	move_and_slide()  # For physics-based nodes like CharacterBody2D
