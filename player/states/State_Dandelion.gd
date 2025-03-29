class_name State_Dandelion extends State

@export var move_speed : float = 300.0

var timer : float = 0.0
var walking : bool = false
var attacking : bool = false

@onready var sprite: AnimatedSprite2D = $"../../Sprite"
@onready var state_machine: PlayerStateMachine = $".."
@onready var base_idle: State = $"../BaseIdle"
@onready var base_walk : State = $"../BaseWalk"
@onready var squid: State = $"../Squid"
@onready var dandelion_power: Node2D = $"../../Powers/DandelionPower"
@onready var flytrap: State = $"../Flytrap"

func enter() -> void:
	player.update_animation("dandelion", "idle")
	dandelion_power.shoot()
	sprite.animation_finished.connect( end_attack )
	attacking = true
	
## What happens when the player exits this State?
func exit():
	sprite.animation_finished.disconnect( end_attack )
	attacking = false
	pass
	
## What happens during the _process update in this State?
func process(_delta: float) -> State:
	player.velocity = player.direction * move_speed
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return base_idle
		else:
			return base_walk
	return null

## What happens during the _physics_process update in this State?
func physics(_delta: float) -> State:
	return null
	
## What happens with input events in this State?
func handle_input(_event: InputEvent) -> State:
	return null
	
func end_attack() -> void:
	if Input.is_action_pressed("left_click"):
		if player.mouse_distance > 200:
			state_machine.change_state(flytrap)
	attacking = false
	
