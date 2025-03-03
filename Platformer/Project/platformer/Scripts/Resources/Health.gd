extends Resource
# Creates an exportable health resource
class_name Health

# Stores an exported value for node local health
@export var current_health:int = 0
# Stores an exported values for node local attack damage
@export var attack_damage:int = 0

signal died()

#function for taking damage
func take_damage(damage: int) -> void:
	current_health -= damage 

	#clamp the min value
	if current_health <= 0:
		current_health = 0
		#emit a signal
		emit_signal("died")
