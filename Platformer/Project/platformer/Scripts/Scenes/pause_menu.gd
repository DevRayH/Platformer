extends Control

var main_menu:PackedScene = load("res://Scenes/main_menu.tscn")


func _on_exit_b_pressed() -> void:
	GameMaster.scene_change.load_scene(main_menu, GameMaster.obj_ref.menu_base)
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base)
	GameMaster.scene_change.remove_scene(
		GameMaster.obj_ref.scene_base.get_child(0),
		GameMaster.obj_ref.scene_base)
	GameMaster.npc_object.paused = false


func _on_return_b_pressed() -> void:
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base.get_child(0))
	GameMaster.npc_object.paused = false
