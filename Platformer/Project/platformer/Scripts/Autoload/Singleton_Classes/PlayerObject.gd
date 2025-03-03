extends Node

class_name PlayerObject

enum States{IDLE, RUNNING, ATTACKING}

func state_machine(passedPlayer:CharacterBody2D):
	match passedPlayer.current_state:
		0:
			passedPlayer.sprite.offset.y = 0.0
			passedPlayer.sprite.play("Idle")
		1:
			passedPlayer.sprite.offset.y = 3.55
			passedPlayer.sprite.play("Run")
		2:
			passedPlayer.sprite.play("Attack")
			if passedPlayer.current_target != null:
				passedPlayer.current_target.health_resource.take_damage(passedPlayer.health_resource.attack_damage)
