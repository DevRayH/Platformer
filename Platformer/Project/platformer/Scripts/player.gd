extends CharacterBody2D

#internal variable
var speed = 200
var gravity = 80

#animation variables
var animations: Array = [
					"Idle",
					"Walk",
					"Attack"]

#states
var anim_state = "Idle"

#nodes
@onready var sprite = $Sprites

func _process(delta):
	if velocity != Vector2.ZERO:
		anim_state = "Idle"
		sprite.play(anim_state)

	if Input.is_action_pressed("fire1"):
		anim_state = "Attack"
		sprite.play(anim_state)

func _physics_process(delta: float) -> void:
	#reset the velocity
	velocity = Vector2.ZERO

	#movement code	
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		anim_state = "Walk" 
		sprite.flip_h = true
	elif Input.is_action_pressed("move_right"):
		velocity.x += speed 
		anim_state = "Walk"
		sprite.flip_h = false

	#jump action
	if Input.is_action_just_pressed("jump"):
		velocity.y = -2000
		
	#apply gravity 
	if not is_on_floor():
		velocity.y += gravity

	#call the move function
	move_and_slide()
