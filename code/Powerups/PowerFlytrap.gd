extends State
class_name PowerFlytrap

@export var player : CharacterBody2D
@export var move_speed := 150.0

var pickup : String
var direction : Vector2
var powerup : Node

func handle_movement():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

func enter():
	handle_movement()
	powerup = preload("res://scenes/power_flytrap.tscn").instantiate()
	get_tree().get_first_node_in_group("player").add_child(powerup)

func update(delta: float):
	handle_movement()

func physics_update(delta: float):
	if pickup == "base":
		Transitioned.emit(self, "Base")
	if pickup == "bamboo":
		Transitioned.emit(self, "Bamboo")
	if pickup == "bird":
		Transitioned.emit(self, "Bird")
	if pickup == "dandelion":
		Transitioned.emit(self, "Dandelion")
	if pickup == "squid":
		Transitioned.emit(self, "Squid")
	if pickup == "tardigrade":
		Transitioned.emit(self, "Tardigrade")
	if pickup == "wolverine":
		Transitioned.emit(self, "Wolverine")
	player.velocity = direction * move_speed

func exit():
	get_tree().get_first_node_in_group("player").remove_child(powerup)
