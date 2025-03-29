extends Node2D

@export var timer : float = 100.0
@export var player : CharacterBody2D

signal base()
signal bamboo()
signal bird()
signal dandelion()
signal flytrap()
signal squid()
signal wolverine()
signal tardigrade()

func _ready() -> void:
	print("jello")

func _physics_process(delta: float) -> void:
	var mouse_distance = self.global_position.distance_to(get_global_mouse_position())
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("left_click"):
		timer -= 2.0
	if Input.is_action_just_released("left_click"):
		if timer > 0:
			if mouse_distance > 150:
				emit_signal("dandelion")
				print("dandelion")
			else:
				emit_signal("base")
				print("base")
		if timer < 0:
			if mouse_distance > 150:
				emit_signal("flytrap")
				print("flytrap")
			else:
				emit_signal("wolverine")
				print("wolverine")
		timer = 100.0
	if Input.is_action_pressed("right_click"):
		timer -= 2.0
	if Input.is_action_just_released("right_click"):
		if get_parent().velocity == Vector2.ZERO:
			emit_signal("bamboo")
			print("bamboo")
		else:
			if timer > 0:
				emit_signal("bird")
				print("bird")
			else:
				emit_signal("tardigrade")
				print("tardigrade")
		timer = 100.0
				
			
