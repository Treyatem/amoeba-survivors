class_name State_Flytrap extends State

@export var charge_duration : float = 0.5
@export var move_speed : float = 60.0

var timer : float = 0.0
var walking : bool = false
var attacking : bool = false

@onready var sprite: AnimatedSprite2D = $"../../Sprite"
@onready var state_machine: PlayerStateMachine = $".."
@onready var base_idle: State = $"../BaseIdle"
@onready var base_walk : State = $"../BaseWalk"
@onready var flytrap_sprite: AnimatedSprite2D = $"../../Powers/FlytrapPower/FlytrapPower/Flytrap Sprite"
@onready var flytrap_hurt_box: HurtBox = $"../../Powers/FlytrapPower/FlytrapPower/FlytrapHurtBox"
@onready var flytrap_power: Node2D = $"../../Powers/FlytrapPower/FlytrapPower"

## What happens when the player enters this State?
func enter() -> void:
	flytrap_sprite.visible = false
	flytrap_sprite.frame = 0
	timer = charge_duration
	attacking = false
	walking = false
	flytrap_hurt_box.monitoring == false
	print("charging")
	
## What happens when the player exits this State?
func exit():
	flytrap_hurt_box.monitoring == false
	pass

## What happens during the _process update in this State?
func process(_delta: float) -> State:
	if timer > 0:
		timer -= _delta
		if timer <= 0:
			timer = 0
	
	if attacking == false:
		player.update_animation("flytrap", "charge")
			
	player.velocity = Vector2.ZERO
	
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
	flytrap_power.set_physics_process(false)
	sprite.play("flytrap_release")
	flytrap_sprite.visible = true
	flytrap_sprite.play("attack")
	flytrap_hurt_box.monitoring = true
	await get_tree().create_timer(0.65).timeout
	print("charge attack")
	flytrap_sprite.visible = false
	flytrap_hurt_box.monitoring = false
	flytrap_power.set_physics_process(true)
	state_machine.change_state(base_idle)
	
