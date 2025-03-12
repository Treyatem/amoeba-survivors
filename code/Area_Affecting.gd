extends Area2D

@export var damage = 1

func temp_disable():
	%Collision.call_deferred("set", "disabled", true)
	%DisableTimer.start()

func _on_disable_hit_box_timer_timeout():
	%Collision.call_deferred("set", "disabled", false)
