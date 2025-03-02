extends CharacterBody2D

#internal variable
var speed = 200
var gravity = 80

# Creates a local heath resource and exports it to the inspector
@export var health_resource:Health = Health.new()

#Animation states and variables 
var anim_state: String = "Idle"
#used for conditional check if a animation can be skipped or not
var anim_dict: Dictionary = {"Idle": true, 
							"Walk": true, 
							"Attack": false}
var can_attack: bool = false

#nodes
@onready var anim = $Sprites
@onready var attack_delay = $AttackDelay
@onready var attack_col = $AttackCol

func _process(delta) -> void:
	set_animation()	

	#Attack code
	if Input.is_action_pressed("fire1"):
		can_attack = true
		anim.play("Attack")
		#set a timer to start the next animation
		attack_delay.start()
		do_damage() 

func _ready() -> void:
	attack_delay.timeout.connect(set_attack_mode)

func _physics_process(delta: float) -> void:
	#reset the velocity
	velocity = Vector2.ZERO

	#call the movement function
	move_to_direction()

	#call the move function
	move_and_slide()
	
#function for input movement
func move_to_direction() -> void:
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		anim.flip_h = true
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		anim.flip_h = false

	#jump code
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= 6000
		
	#gravity
	if is_on_floor() == false:
		velocity.y += gravity


#It doesn't work properly for attack button, like it doesn't register inputs when
#the attack button is being held. 
func _unhandled_input(event: InputEvent) -> void:
	pass
		

#Ray's animation code
func set_animation():
	if can_attack == false:
		if velocity:
			anim.play("Walk")
		else:
			anim.play("Idle")

#set the variable to false so that other animation gets played instead
func set_attack_mode() -> void:
	can_attack = false

#apply damage to NPC when its called 
func do_damage() -> void:
	var collided_with = attack_col.get_overlapping_bodies()
	
	for bodies in collided_with:
		if 'health_resource' in bodies:
			#print(bodies.name, bodies.health_resource.current_health)
			bodies.health_resource.current_health -= health_resource.attack_damage
	
