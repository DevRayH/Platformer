extends Resource
# Creates an exportable health resource
class_name Health

# Stores an exported value for node local health
@export var current_health:int = 0
# Stores an exported values for node local attack damage
@export var attack_damage:int = 0

func take_damage(passedDamage:int):
	current_health -= passedDamage
