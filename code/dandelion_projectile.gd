extends Area2D

var direction: Vector2
var move_speed = 5

func _physics_process(delta):
	$Projectile.play("default")
	global_position += direction * move_speed

func _on_area_entered(area: Area2D):
	set_physics_process(false)
	$Projectile.play("timeout")
	%HitTimer.start()

func _on_hit_timer_timeout():
	queue_free()
