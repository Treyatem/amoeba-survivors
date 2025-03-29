class_name State_Squid extends State

@export var charge_duration : float = 1.0
@export var move_speed : float = 60.0

var timer : float = 0.0
var walking : bool = false
var attacking : bool = false

@onready var sprite: AnimatedSprite2D = $"../../Sprite"
@onready var state_machine: PlayerStateMachine = $".."
@onready var base_idle: State = $"../BaseIdle"
@onready var base_walk : State = $"../BaseWalk"
@onready var squid_hurt_box: HurtBox = $"../../Powers/SquidHurtBox"

## What happens when the player enters this State?
func enter() -> void:
	timer = charge_duration
	attacking = false
	walking = false
	squid_hurt_box.monitoring = false
	print("charging")
	
## What happens when the player exits this State?
func exit():
	squid_hurt_box.monitoring = false
	pass
	
## What happens during the _process update in this State?
func process(_delta: float) -> State:
	if timer > 0:
		timer -= _delta
		if timer <= 0:
			timer = 0
	
	if attacking == false:
		player.update_animation("squid", "charge")
			
	player.velocity = player.direction * move_speed
	
	return null

## What happens during the _physics_process update in this State?
func physics(_delta: float) -> State:
	return null
	
## What happens with input events in this State?
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_released("left_click"):
		if timer > 0:
			return base_idle
		elif attacking == false:
			charge_attack()
	return null
	
func charge_attack() -> void:
	attacking = true
	sprite.play("squid_release")
	squid_hurt_box.monitoring = true
	await get_tree().create_timer(0.8).timeout
	print("charge attack")
	state_machine.change_state(base_idle)
	
