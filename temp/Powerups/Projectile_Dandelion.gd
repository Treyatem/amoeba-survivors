extends Area2D

var direction: Vector2
var move_speed = 5

func _physics_process(_delta):
	$Sprite.play("default")
	global_position += direction * move_speed

func _on_area_entered(_area: Area2D):
	set_physics_process(false)
	$Sprite.play("timeout")
	%HitTimer.start()

func _on_hit_timer_timeout():
	queue_free()
