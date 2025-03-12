extends Node2D

func spawn_mob():
	var new_enem = preload("res://scenes/test_enemy.tscn").instantiate()
	%EnemSpawnFollow.progress_ratio = randf()
	new_enem.global_position = %EnemSpawnFollow.global_position
	add_child(new_enem)
