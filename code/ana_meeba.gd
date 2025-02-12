extends CharacterBody2D

var move_speed = 300.0

func _physics_process(delta: float) -> void:
	movement()
	
func movement():
		# Get the input direction and handle the movement/deceleration.
	#var x_direction := Input.get_axis("move_left", "move_right")
	#if x_direction:
		#velocity.x = x_direction * move_speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, move_speed)
	#var y_direction := Input.get_axis("move_up", "move_down")
	#if y_direction:
		#velocity.y = y_direction * move_speed
	#else:
		#velocity.y = move_toward(velocity.y, 0, move_speed)
#
	#move_and_slide()
	var x_direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_direction = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var movement = Vector2(x_direction, y_direction)
	velocity = movement.normalized() * move_speed
	move_and_slide()
