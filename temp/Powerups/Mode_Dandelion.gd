extends Node2D

func shoot():
	var new_bullet = preload("res://items/attacks/dandelion_bullet.tscn").instantiate()
	new_bullet.global_position = get_tree().get_first_node_in_group("player").global_position
	new_bullet.direction = (get_global_mouse_position() - global_position).normalized()
	add_child(new_bullet)
