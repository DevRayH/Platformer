extends Control

# Direct load of the main menu scene
var main_menu:PackedScene = load("res://Scenes/main_menu.tscn")

@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	audio.play()


func _on_exit_b_pressed() -> void:
	# Adds the main menu to the scene tree
	GameMaster.scene_change.load_scene(main_menu, GameMaster.obj_ref.menu_base)
	# Removes the pause menu from the scene tree
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base)
	# Removes the active level node from the scene tree
	GameMaster.scene_change.remove_scene(
		GameMaster.obj_ref.scene_base.get_child(0),
		GameMaster.obj_ref.scene_base)
	# Sets the global paused bool to false allowing npc movement
	GameMaster.npc_object.paused = false


func _on_return_b_pressed() -> void:
	# Removes the pause menu from the scene tree
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base.get_child(0))
	# Sets infor menu to visible
	GameMaster.obj_ref.info_menu.show()
	# Sets the global paused bool to false allowing npc movement
	GameMaster.npc_object.paused = false
