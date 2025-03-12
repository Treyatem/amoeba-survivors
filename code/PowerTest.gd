extends State
class_name PowerTest

@export var move_speed := 900.0

var direction : Vector2

func handle_movement():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

func enter():
	handle_movement()

func update(delta: float):
	handle_movement()

func physics_update(delta: float):
	if Input.is_action_just_pressed("p"):
		Transitioned.emit(self, "Base")
