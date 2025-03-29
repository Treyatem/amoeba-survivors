class_name HurtBox extends Area2D

@export var damage : int = 1

func _ready():
	area_entered.connect(area_is_entered)
	
	
func area_is_entered(a:Area2D) -> void:
	if a is HitBox:
		a.take_damage(damage)
