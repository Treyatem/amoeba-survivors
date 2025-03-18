extends Area2D

@export_enum("Cooldown", "HitOnce", "DisableHitBox") var HurtBoxType = 0

@onready var collision = $Collision
@onready var disableTimer = $DisableTimer

var type : String
signal hurt(damage)
signal pickup(type)

func _on_area_entered(area: Area2D):
	if area.is_in_group("attack"):
		if not area.get("damage") == null:
			match HurtBoxType:
				0: #Collision
					collision.call_deferred("set", "disabled", true)
					disableTimer.start()
				1: #HitOnce
					pass
				2: #DisableHitBox
					if area.has_method("temp_disable"):
						area.temp_disable()
			var damage = area.damage
			emit_signal("hurt", damage)
	if area.is_in_group("base"):
		var type = "base"
		emit_signal("pickup", type)
	if area.is_in_group("dandelion"):
		var type = "dandelion"
		emit_signal("pickup", type)
	if area.is_in_group("squid"):
		var type = "squid"
		emit_signal("pickup", type)


func _on_disable_timer_timeout():
	collision.call_deferred("set", "disabled", false)
