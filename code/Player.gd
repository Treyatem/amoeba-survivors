extends CharacterBody2D

var move_speed = 300.0
var hp = 80
var pickup : String
@onready var sprite = $Sprite_Player

func _physics_process(_delta) -> void:
	if pickup == "dandelion":
		dandelion_animate()
	else:
		base_animate()
	move_and_slide()
	
func dandelion_animate():
	sprite.play("dandelion")
	
func base_animate():
	if Input.is_action_just_pressed("move_left"):
		sprite.play("left")
	if Input.is_action_just_pressed("move_right"):
		sprite.play("right")
	if Input.is_action_just_pressed("move_up"):
		sprite.play("up")
	if Input.is_action_just_pressed("move_down"):
		sprite.play("down")

func _on_hurt_box_hurt(damage: Variant):
	hp -= damage
	print(hp)

func _on_hurt_box_pickup(type: Variant):
	pickup = type
	print(pickup)
