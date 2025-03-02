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
		pass

	if Input.is_action_pressed("fire1"):
		pass

func _physics_process(delta: float) -> void:
	#reset the velocity
	velocity = Vector2.ZERO

	#movement code	
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		sprite.flip_h = true
	elif Input.is_action_pressed("move_right"):
		velocity.x += speed 
		sprite.flip_h = false

	#jump action
	#if Input.is_action_just_pressed("jump"):
		#velocity.y = -2000
		
	#apply gravity 
	#if not is_on_floor():
		#velocity.y += gravity

	#call the move function
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	#Movement code
	if Input.is_action_pressed("move_left"):
		pass
	
	if Input.is_action_pressed("move_right"):
		pass

	if Input.is_action_just_pressed("jump"):
		pass
