extends Node2D

@onready var collision = $Area_Affecting/Collision

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot") and %Cooldown.is_stopped():
		shoot()
		
func shoot():
	collision.call_deferred("set", "disabled", false)
	%Cooldown.start()

func _on_cooldown_timeout() -> void:
	collision.call_deferred("set", "disabled", true)
	%Cooldown.stop()
