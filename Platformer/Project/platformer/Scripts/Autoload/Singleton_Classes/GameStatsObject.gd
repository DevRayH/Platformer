extends Node

class_name Game_Stats_Object


func player_lives(passedPlayerScene:PackedScene, passedScene:Node):
	var lives:int = int(GameMaster.obj_ref.player_lives_label.text)
	if lives > 0:
		lives -= 1
		
		GameMaster.scene_change.npc_loading(
			passedPlayerScene,
			passedScene,
			GameMaster.npc_object.tree.get_nodes_in_group("SpawnPoints")[1].position)
			
		GameMaster.obj_ref.player_lives_label.text = str(lives)
