class_name State_Base_Walk extends State

@export var move_speed : float = 1000.0

@onready var base_idle : State = $"../BaseIdle"
@onready var base_attack: State = $"../BaseAttack"
@onready var dandelion: State_Dandelion = $"../Dandelion"

## What happens when the player enters this State?
func enter() -> void:
	player.update_animation("base", "walk")
	pass
	
## What happens when the player exits this State?
func exit():
	pass
	
## What happens during the _process update in this State?
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return base_idle
		
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("base", "walk")
	return null

## What happens during the _physics_process update in this State?
func physics(_delta: float) -> State:
	return null
	
## What happens with input events in this State?
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("left_click"):
		if player.mouse_distance > 300:
			return dandelion
		else:
			return base_attack
	return null
	
