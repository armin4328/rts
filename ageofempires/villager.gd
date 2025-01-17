extends CharacterBody2D

@onready var anim = $AnimationPlayer

func _physics_process(delta: float) -> void:
	if velocity.x == 0 and velocity.y == 0:
		anim.play("idle")
