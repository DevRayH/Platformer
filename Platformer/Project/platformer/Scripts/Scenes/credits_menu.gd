extends Control

# Fresh load of the main menu scene
@onready var main_menu:PackedScene = load("res://Scenes/main_menu.tscn")
@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	# Plays the wav file in the AudioStreamPleayer
	audio.play()


func _on_return_pressed() -> void:
	# Loads main menu
	GameMaster.scene_change.load_scene(main_menu, GameMaster.obj_ref.menu_base)
	# Removes credits menu
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base)
