extends CharacterBody2D

# Speed and acceleration
var speed:float = 100.0
var accel:float = 30.0

# Booleans yo control when the NPC starts movement and if NPC can attack
var nav_mesh_ready:bool = false
var can_attack:bool = false

# Reference to the active node of the current target.
var current_target:CharacterBody2D
# Local current state
var current_state:NPC_Object.NPCStates

@onready var anim:AnimatedSprite2D = $AnimatedSprite2D
@onready var navlink:NavigationAgent2D = $NavigationLink2D

# Creates a local heath resource and exports it to the inspector
@export var health_resource:Health = Health.new()


func _physics_process(delta: float) -> void:
	if nav_mesh_ready:
		# Calls global movement function and passes a refernce to the calling node and elapsed time
		GameMaster.npc_object.movement(self, delta)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Waits one cycle for the nav mesh to move into the tree
	nav_mesh_ready = true


# If active player node enters this area the local current state is set to Attacking
# can attack is flipped true, and attack target it set to active player node
func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		current_state = GameMaster.npc_object.NPCStates.ATTACKING
		can_attack = true
		current_target = body


# If active player node leaves attack area local current state is set to Idle
# local can attack is flipped to false, and local current target is set to null
func _on_attack_area_body_exited(body: Node2D) -> void:
	if 'health_resource' in body:
		current_state = GameMaster.npc_object.NPCStates.IDLE
		if can_attack == true:
			can_attack = false
			current_target = null


# When NPC reaches it's current target the local current state is changed to IDLE
func _on_navigation_link_2d_target_reached() -> void:
	current_state = GameMaster.npc_object.NPCStates.IDLE
