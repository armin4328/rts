extends ColorRect

var mouse_down : bool
var mouse_start_pos : Vector2
var mouse_and_pos : Vector2 

func _input(event):
	if event is InputEventMouseButton and !Global.moving:
		if event.button_index == 1 and event.is_pressed():
			if !mouse_down:
				mouse_down = true
				mouse_start_pos = get_global_mouse_position()
			global_position = mouse_start_pos
		elif !event.is_pressed():
			if mouse_down:
				mouse_and_pos = event.global_position
				mouse_down = false
				size = Vector2.ZERO
	if event is InputEventMouseMotion:
		if mouse_down:
			_update()

func _update():
	if get_global_mouse_position().x < mouse_start_pos.x:
		scale.x = -1
	elif get_global_mouse_position().x > mouse_start_pos.x:
		scale.x = 1
	if get_global_mouse_position().y < mouse_start_pos.y:
		scale.y = -1
	elif get_global_mouse_position().y > mouse_start_pos.y:
		scale.y = 1
	
	size = (get_global_mouse_position() - mouse_start_pos)*scale
