extends Area2D

@export var damage = 1
@onready var collision = $Collision
@onready var disableTimer = $DisableHitBoxTimer

func temp_disable():
	collision.call_deferred("set", "disabled", true)
	disableTimer.start()

func _on_disable_hit_box_timer_timeout():
	collision.call_deferred("set", "disabled", false)
