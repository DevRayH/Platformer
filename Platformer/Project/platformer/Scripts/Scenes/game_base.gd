extends Node

# Preloads the main menu
var main_menu:PackedScene = preload("res://Scenes/main_menu.tscn")


func _enter_tree() -> void:
	# Passes references on the base nodes to the object reference class on the autoload
	set_references()


func _ready() -> void:
	# Loads the main menu into the scene tree
	GameMaster.scene_change.load_scene(main_menu, GameMaster.obj_ref.menu_base)


func set_references():
	GameMaster.npc_object.tree = get_tree()
	GameMaster.obj_ref.game_base = self
	GameMaster.obj_ref.scene_base = $SceneBase
	GameMaster.obj_ref.menu_base = $MenuBase
