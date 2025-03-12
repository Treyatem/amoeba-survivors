extends State
class_name PowerBase

@export var player : CharacterBody2D
@export var move_speed := 300.0

var direction : Vector2
var pickup : String

func handle_movement():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

func enter():
	handle_movement()

func update(_delta: float):
	handle_movement()

func physics_update(_delta: float):
	if pickup == "dandelion":
		Transitioned.emit(self, "Dandelion")
	player.velocity = direction * move_speed


func _on_hurt_box_pickup(type: Variant):
	pickup = type
