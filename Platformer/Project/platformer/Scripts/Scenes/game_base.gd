extends Node

var main_menu:PackedScene = preload("res://Scenes/main_menu.tscn")


func _enter_tree() -> void:
	set_references()


func _ready() -> void:
	GameMaster.scene_change.load_scene(main_menu, GameMaster.obj_ref.menu_base)


func set_references():
	GameMaster.npc_object.tree = get_tree()
	GameMaster.obj_ref.game_base = self
	GameMaster.obj_ref.scene_base = $SceneBase
	GameMaster.obj_ref.menu_base = $MenuBase
