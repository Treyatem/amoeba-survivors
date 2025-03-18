extends Node2D

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var new_bullet = preload("res://scenes/Projectile_Dandelion.tscn").instantiate()
	new_bullet.global_position = get_tree().get_first_node_in_group("player").global_position
	new_bullet.direction = (get_global_mouse_position() - global_position).normalized()
	add_child(new_bullet)
	
## TODO: add reloading
