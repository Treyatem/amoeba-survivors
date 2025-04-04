extends CharacterBody2D

@export var movement_speed = 70.0
@export var hp = 10.0

@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	$HitBox.damaged.connect( take_damage )

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()

func take_damage( _damage : int) -> void:
	hp -= _damage
	print(hp)
	if hp <= 0:
		queue_free()
	

func _on_hurt_box_hurt(damage: Variant) -> void:
	hp -= damage
	print(hp)
	if hp <= 0:
		queue_free()
