extends Node

var main_menu:PackedScene = preload("res://Scenes/main_menu.tscn")


func _enter_tree() -> void:
	GameMaster.npc_object.tree = get_tree()
	GameMaster.obj_ref.game_base = self
	GameMaster.obj_ref.scene_base = $SceneBase
	GameMaster.obj_ref.menu_base = $MenuBase


func _ready() -> void:
	ready_scene()
	
	
func ready_scene():
	var node:Control = main_menu.instantiate()
	GameMaster.obj_ref.menu_base.add_child(node)
