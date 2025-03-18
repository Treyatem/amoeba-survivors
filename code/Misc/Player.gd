extends CharacterBody2D

var move_speed = 300.0
var hp = 80
var pickup : String
@onready var sprite = $Sprite

func _physics_process(_delta) -> void:
	if pickup == "dandelion":
		dandelion_animate()
	elif pickup == "squid":
		squid_animate()
	else:
		base_animate()
	move_and_slide()
	
func dandelion_animate():
	sprite.play("dandelion")
	
func squid_animate():
	sprite.play("squid")
	
func base_animate():
	if Input.is_action_just_pressed("move_left"):
		sprite.play("left")
	if Input.is_action_just_pressed("move_right"):
		sprite.play("right")
	if Input.is_action_just_pressed("move_up"):
		sprite.play("up")
	if Input.is_action_just_pressed("move_down"):
		sprite.play("down")

func _on_detection_hurt(damage: Variant) -> void:
	hp -= damage
	print(hp)

func _on_detection_pickup(type: Variant) -> void:
	pickup = type
	print(pickup)
