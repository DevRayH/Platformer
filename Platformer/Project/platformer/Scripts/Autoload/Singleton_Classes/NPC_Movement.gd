extends Node
class_name NPC_Object

# Stores a reference to the active gametree
var tree:SceneTree

# Enumerations containing all possible NPC states
enum NPCStates{IDLE, RUNNING, ATTACKING}


func movement(passedBody:CharacterBody2D, time:float):
	# Tests current state and active player node
	if passedBody.current_state != NPCStates.ATTACKING and GameMaster.obj_ref.current_player != null:
		var direction:Vector2 = Vector2()
		# Sets NPC current movement target as active player node
		passedBody.navlink.target_position = GameMaster.obj_ref.current_player.position
		# Test horizonal relative value of active player node
		if GameMaster.obj_ref.current_player.position.x > passedBody.position.x:
			# Reverses the sprite
			passedBody.get_child(1).flip_h = true
		else:
			# Returns sprite to original position
			passedBody.get_child(1).flip_h = false
		# Passes the location of the next path position to direction
		direction = passedBody.navlink.get_next_path_position() - passedBody.position
		
		# Tests if can_attack has been activated indicating the the active player node is in
		# attack range
		if passedBody.can_attack == false:
			# Normilizes direction to smooth movements
			direction = direction.normalized()
			# Passes converts and passes direction to velocity. Uses lerp to futher smooth movements
			passedBody.velocity = passedBody.velocity.lerp(direction * passedBody.speed, passedBody.accel * time)
			# Adds gravity
			passedBody.velocity += Vector2(0, 50)
			# Test current target and navigation progess to determine if the NPC is still traveling
			if passedBody.current_target == null and passedBody.navlink.is_navigation_finished() == false:
				passedBody.current_state = NPCStates.RUNNING
	
	# Test is active player node is null
	elif GameMaster.obj_ref.current_player == null:
		passedBody.current_state = NPCStates.IDLE
		passedBody.velocity += Vector2(0, 50)
	
	# After setting the local velocity on the calling node.
	# This calls the local move and slide on the calling node
	passedBody.move_and_slide()
	# Calls the global NPC statemachine and passes and reference to the calling node into it
	state_machine(passedBody)


func state_machine(passedBody:CharacterBody2D):
	# Tests the local current state of the calling node
	match passedBody.current_state:
		0:
			passedBody.anim.play("Idle")
		1:
			passedBody.anim.play("Run")
		2:
			if passedBody.anim.is_playing() == false:
				passedBody.anim.play("Attack")
				# Passes calling node's local damage factor to it's local current target
				passedBody.current_target.health_resource.current_health -= passedBody.health_resource.attack_damage
