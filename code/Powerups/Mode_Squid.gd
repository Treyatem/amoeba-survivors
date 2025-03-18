extends Node2D

@onready var collision = $Area_Affecting/Collision

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("o"):
		%ChargeTime.start()
		print("charge start")
		while Input.is_action_pressed("o") and not %ChargeTime.is_stopped():
			if Input.is_action_just_released("o"):
				%ChargeTime.stop()
#
func _on_charge_time_timeout() -> void:
	collision.call_deferred("set", "disabled", true)
	#set_physics_process(false)
	#if Input.is_action_just_released("o"):
		#attack()
		#
#func attack():
	#collision.call_deferred("set", "disabled", false)
	#%CooldownTime.start()
	#
#func _on_cooldown_time_timeout() -> void:
	#set_physics_process(true)
