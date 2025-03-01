extends Node
class_name NPC_Object

var tree:SceneTree

func movement(passedBody:CharacterBody2D, time:float):
	var direction:Vector2 = Vector2()
	passedBody.navlink.target_position = tree.get_nodes_in_group("PatrolPoints")[0].position
	direction = passedBody.navlink.get_next_path_position() - passedBody.position
	
	if passedBody.can_attack == false:
		direction = direction.normalized()
		passedBody.velocity = passedBody.velocity.lerp(direction * passedBody.speed, passedBody.accel * time)
		passedBody.move_and_slide()
		
	passedBody.set_animation()
