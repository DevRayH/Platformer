extends CharacterBody2D

var speed:float = 60.0
var accel:float = 30.0
var Velocity:Vector2

@onready var anim:AnimatedSprite2D = $AnimatedSprite2D
@onready var navlink:NavigationAgent2D = $NavigationLink2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement(delta)

func movement(delta:float):
	var direction:Vector2 = Vector2()
	navlink.target_position = get_tree().get_nodes_in_group("PatrolPoints")[0].position
	direction = navlink.get_next_path_position() - self.position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
	
	
	


func _on_animated_sprite_2d_animation_finished() -> void:
	anim.play("Idle")


func _on_attack_timer_timeout() -> void:
	anim.play("Attack")
