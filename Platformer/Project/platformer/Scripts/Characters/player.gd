extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var pause_scene:PackedScene = preload("res://Scenes/pause_menu.tscn")

var current_target:CharacterBody2D = null
var current_state:PlayerObject.States = PlayerObject.States.IDLE

@onready var ray:RayCast2D = $RayCast2D
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D

@export var health_resource:Health = Health.new()

func _enter_tree() -> void:
	GameMaster.obj_ref.current_player = self
	health_resource.attack_damage = 10
	health_resource.current_health = 20
	

func _ready() -> void:
	if GameMaster.obj_ref.current_player == null:
		GameMaster.obj_ref.current_player = self
	#GameMaster.npc_object.paused = true	


func _physics_process(delta: float) -> void:
	if health_resource.current_health == 0:
		GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.scene_base.get_child(0))
		GameMaster.obj_ref.current_player = null
		return


func _process(delta: float) -> void:
	target()
	movement()
	fall(delta)
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		jump()
	if event.is_action_pressed("Pause"):
		pause()
	if event.is_action_pressed("Attack"):
		current_state = PlayerObject.States.ATTACKING
		GameMaster.player_object.state_machine(self)
		

#regionMovement Node movement
func movement():
	if current_state == PlayerObject.States.ATTACKING and sprite.is_playing():
		return
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction < 0.0:
		
		sprite.flip_h = true
		current_target = null
		var ray_targ:Vector2 = ray.target_position
		if ray_targ.x > 0.0:
			ray_targ.x *= -1
			ray.target_position = ray_targ
		current_state = PlayerObject.States.RUNNING
		
	elif direction > 0.0:
		if abs(direction) <  .1:
			return
		
		sprite.flip_h = false
		current_target = null
		var ray_targ:Vector2 = ray.target_position
		if ray_targ.x < 0.0:
			ray_targ.x *= -1
			ray.target_position = ray_targ
		current_state = PlayerObject.States.RUNNING
	
	else:
		current_state = PlayerObject.States.IDLE
			
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	GameMaster.player_object.state_machine(self)


func fall(delta:float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


func jump():
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
#endregion


func pause():
	GameMaster.obj_ref.scene_base.get_child(0).audio.stop()
	GameMaster.npc_object.paused = true
	var node:Control = pause_scene.instantiate()
	GameMaster.obj_ref.menu_base.add_child(node)
	GameMaster.obj_ref.info_menu.hide()


func attack():
	current_state = PlayerObject.States.ATTACKING
	
func target():
	if ray.is_colliding():
		if current_target == null:
			current_target = ray.get_collider()
	else:
		current_target = null
