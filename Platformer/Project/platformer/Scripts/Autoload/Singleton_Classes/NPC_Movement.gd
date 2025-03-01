extends Node
class_name NPC_Object

var tree:SceneTree

var current_state:NPCStates
enum NPCStates{IDLE, RUNNING, ATTACKING}

func movement(passedBody:CharacterBody2D, time:float):
	if current_state != NPCStates.ATTACKING and GameMaster.obj_ref.current_player != null:
		var direction:Vector2 = Vector2()
		passedBody.navlink.target_position = GameMaster.obj_ref.current_player.position
		if GameMaster.obj_ref.current_player.position.x > passedBody.position.x:
			passedBody.get_child(1).flip_h = true
		direction = passedBody.navlink.get_next_path_position() - passedBody.position
	
		if passedBody.can_attack == false:
			direction = direction.normalized()
			passedBody.velocity = passedBody.velocity.lerp(direction * passedBody.speed, passedBody.accel * time)
			passedBody.velocity += Vector2(0, 50)
		
			if passedBody.current_target == null and passedBody.navlink.is_navigation_finished() == false:
				current_state = NPCStates.RUNNING
			passedBody.move_and_slide()
		
	state_machine(passedBody)


func state_machine(passedBody:CharacterBody2D):
	match current_state:
		0:
			passedBody.anim.play("Idle")
		1:
			passedBody.anim.play("Run")
		2:
			if passedBody.anim.is_playing() == false:
				passedBody.anim.play("Attack")
				passedBody.current_target.health_resource.current_health -= passedBody.health_resource.attack_damage
