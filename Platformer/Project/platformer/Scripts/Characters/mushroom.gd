extends CharacterBody2D

var speed:float = 100.0
var accel:float = 30.0
var Velocity:Vector2

var nav_mesh_ready:bool = false
var can_attack:bool = false

var current_target:CharacterBody2D

@onready var anim:AnimatedSprite2D = $AnimatedSprite2D
@onready var navlink:NavigationAgent2D = $NavigationLink2D
@export var health_resource:Health = Health.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if nav_mesh_ready:
		movement(delta)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	nav_mesh_ready = true

func movement(delta:float):
	var direction:Vector2 = Vector2()
	navlink.target_position = get_tree().get_nodes_in_group("PatrolPoints")[0].position
	direction = navlink.get_next_path_position() - self.position
	
	if can_attack == false:
		direction = direction.normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
		move_and_slide()
		
	set_animation()
	
	
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


func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		can_attack = true
		current_target = body

func _on_attack_area_body_exited(body: Node2D) -> void:
	if 'health_resource' in body:
		if can_attack == true:
			can_attack = false
			current_target = null


func _on_attack_timer_timeout() -> void:
	if current_target != null:
		can_attack = true
