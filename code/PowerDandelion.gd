extends State
class_name PowerDandelion

@export var player : CharacterBody2D
@export var move_speed := 900.0

var pickup : String
var direction : Vector2

func handle_movement():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

func enter():
	handle_movement()

func update(delta: float):
	handle_movement()

func physics_update(delta: float):
	if pickup == "base":
		Transitioned.emit(self, "Base")
	player.velocity = direction * move_speed

func _on_hurt_box_pickup(type: Variant) -> void:
	pickup = type
	
