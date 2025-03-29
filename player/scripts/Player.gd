class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var mouse_distance : float

var attack_type

var timer : float = 100.0
var hp = 80
var pickup : String
var charged : bool

@onready var sprite = $Sprite
@onready var state_machine : PlayerStateMachine = $StateMachine

signal direction_changed( new_direction: Vector2 )

func _ready() -> void:
	state_machine.initialize(self)

func _process(delta: float) -> void:
	mouse_distance = self.global_position.distance_to(get_global_mouse_position())
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

func _physics_process(_delta) -> void:
	#base_animate()
	#abilities()
	move_and_slide()
	
#func abilities():
	#var mouse_distance = self.global_position.distance_to(get_global_mouse_position())
	#look_at(get_global_mouse_position())
	#if Input.is_action_pressed("left_click"):
		#timer -= 2.0
		#if timer > 0:
			#if mouse_distance > 150:
				#dandelion()
				#sprite.play("dandelion")
				#print("dandelion")
			#else:
				#print("base")
		#if timer < 0:
			#if mouse_distance > 150:
				#print("flytrap")
			#else:
				#print("wolverine")
		#timer = 100.0
	#if Input.is_action_pressed("right_click"):
		#timer -= 2.0
		#if get_parent().velocity == Vector2.ZERO:
			#print("bamboo")
		#else:
			#if timer > 0:
				#print("bird")
			#else:
				#print("tardigrade")
		#timer = 100.0
	#
##func base_animate():
	##if Input.is_action_pressed("move_left"):
		##sprite.play("base_walk_L")
	##elif Input.is_action_pressed("move_right"):
		##sprite.play("base_walk_R")
	##elif Input.is_action_pressed("move_up"):
		##sprite.play("base_walk_U")
	##elif Input.is_action_pressed("move_down"):
		##sprite.play("base_walk_D")
	##else:
		##sprite.set_frame(0)
		##sprite.stop()
		#
#func dandelion():
	#var new_bullet = preload("res://scenes/Projectile_Dandelion.tscn").instantiate()
	#new_bullet.global_position = get_tree().get_first_node_in_group("player").global_position
	#new_bullet.direction = (get_global_mouse_position() - global_position).normalized()
	#add_child(new_bullet)

func set_direction() -> bool:
	var new_direction : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_direction == cardinal_direction:
		return false
	
	direction_changed.emit(new_direction)	
	cardinal_direction = new_direction
	return true
	
func update_animation(state : String, action : String) -> void:
	if state == "squid" or state == "dandelion" or state == "flytrap":
		sprite.play(state + "_" + action)
	else:
		sprite.play(state + "_" + action + "_" + anim_direction())
	
func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	elif cardinal_direction == Vector2.RIGHT:
		return "right"
	else:
		return "left"

func _on_detection_hurt(damage: Variant) -> void:
	hp -= damage
	print(hp)

func _on_detection_pickup(type: Variant) -> void:
	pickup = type
	print(pickup)

#func _on_abilities_base() -> void:
	#pass # Replace with function body.
#
#func _on_abilities_dandelion() -> void:
	#sprite.play("dandelion")
	#var new_bullet = preload("res://scenes/Projectile_Dandelion.tscn").instantiate()
	#new_bullet.global_position = get_tree().get_first_node_in_group("player").global_position
	#new_bullet.direction = (get_global_mouse_position() - global_position).normalized()
	#add_child(new_bullet)
