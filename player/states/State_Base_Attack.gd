class_name State_Base_Attack extends State

var attacking : bool = false
@export_range(1,20,0.5) var decelerate_speed : float = 5.0

@onready var sprite: AnimatedSprite2D = $"../../Sprite"
@onready var state_machine: PlayerStateMachine = $".."
@onready var base_idle: State = $"../BaseIdle"
@onready var base_walk : State = $"../BaseWalk"
@onready var hurt_box: HurtBox = $"../../Powers/BaseHurtBox"
@onready var squid: State = $"../Squid"
@onready var flytrap: State = $"../Flytrap"

## What happens when the player enters this State?
func enter() -> void:
	player.update_animation("base", "attack")
	sprite.animation_finished.connect( end_attack )
	attacking = true
	await get_tree().create_timer(0.075).timeout
	hurt_box.monitoring = true
	pass
	
## What happens when the player exits this State?
func exit():
	sprite.animation_finished.disconnect( end_attack )
	attacking = false
	hurt_box.monitoring = false
	pass
	
## What happens during the _process update in this State?
func process(_delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
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
		if player.mouse_distance < 50:
			state_machine.change_state(squid)
		else:
			state_machine.change_state(flytrap)
	attacking = false
	
