extends Node

class_name Game_Stats_Object


func player_lives(passedPlayerScene:PackedScene):
	var lives:String = GameMaster.obj_ref.player_lives_label.text
	if int(lives) > 0:
		var new_lives:int = int(lives)
		new_lives -= 1
		
		GameMaster.scene_change.npc_loading(
			passedPlayerScene,
			self,
			GameMaster.npc_object.tree.get_nodes_in_group("SpawnPoints")[1].position)
			
		GameMaster.obj_ref.player_lives_label.text = str(new_lives)
