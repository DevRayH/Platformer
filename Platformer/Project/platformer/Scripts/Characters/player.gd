extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var pause_scene:PackedScene = preload("res://Scenes/pause_menu.tscn")

@export var health_resource:Health = Health.new()

func _enter_tree() -> void:
	GameMaster.obj_ref.current_player = self


func _physics_process(delta: float) -> void:
	if health_resource.current_health == 0:
		GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.scene_base.get_child(0))
		GameMaster.obj_ref.current_player = null
		return
		
	jump()
	fall(delta)
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
		movement()
	if event.is_action_pressed("Pause"):
		pause()

func movement():
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


func fall(delta:float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
func jump():
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func pause():
	GameMaster.npc_object.paused = true
	var node:Control = pause_scene.instantiate()
	GameMaster.obj_ref.menu_base.add_child(node)
