extends CharacterBody2D

var speed:float = 100.0
var accel:float = 30.0
var control_distance:Vector2 = Vector2(0, 0)

var nav_mesh_ready:bool = false
var can_attack:bool = false

var current_target:CharacterBody2D

@onready var anim:AnimatedSprite2D = $AnimatedSprite2D
@onready var navlink:NavigationAgent2D = $NavigationLink2D
@export var health_resource:Health = Health.new()


func _physics_process(delta: float) -> void:
	if nav_mesh_ready:
		GameMaster.npc_object.movement(self, delta)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	nav_mesh_ready = true

<<<<<<< HEAD
	
func set_animation():
	if can_attack == false:
		if velocity:
			anim.play("Run")
		else:
			anim.play("Idle")
	else:
		if anim.is_playing() == false:
			anim.play("Attack")
			current_target.health_resource.current_health -= health_resource.attack_damage

=======
>>>>>>> main

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		GameMaster.npc_object.current_state = GameMaster.npc_object.NPCStates.ATTACKING
		can_attack = true
		current_target = body


func _on_attack_area_body_exited(body: Node2D) -> void:
	if 'health_resource' in body:
		GameMaster.npc_object.current_state = GameMaster.npc_object.NPCStates.IDLE
		if can_attack == true:
			can_attack = false
			current_target = null


func _on_navigation_link_2d_target_reached() -> void:
	GameMaster.npc_object.current_state = GameMaster.npc_object.NPCStates.IDLE
	pass # Replace with function body.
