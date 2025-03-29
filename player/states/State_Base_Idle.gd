class_name State_Base_Idle extends State

@onready var base_walk : State = $"../BaseWalk"
@onready var base_attack: State = $"../BaseAttack"

## What happens when the player enters this State?
func enter() -> void:
	player.update_animation("base_idle")
	pass
	
## What happens when the player exits this State?
func exit():
	pass
	
## What happens during the _process update in this State?
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return base_walk
	player.velocity = Vector2.ZERO
	return null

## What happens during the _physics_process update in this State?
func physics(_delta: float) -> State:
	return null
	
## What happens with input events in this State?
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("left_click"):
		return base_attack
	return null
	
